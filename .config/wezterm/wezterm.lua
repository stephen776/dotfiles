-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 16
config.line_height = 1.2
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- disable ligatures
config.window_background_opacity = 0.9
config.default_workspace = "main"

-- Dim inactive panes
config.inactive_pane_hsb = {
	-- saturation = 0.24,
	brightness = 0.5,
}

-- key bindings
local function is_vim(pane)
	local process_info = pane:get_foreground_process_info()
	local process_name = process_info and process_info.name

	return process_name == "nvim" or process_name == "vim"
end

local function find_vim_pane(tab)
	for _, pane in ipairs(tab:panes()) do
		if is_vim(pane) then
			return pane
		end
	end
end

local direction_keys = {
	LeftArrow = "Left",
	DownArrow = "Down",
	UpArrow = "Up",
	RightArrow = "Right",
	-- reverse lookup
	n = "Left",
	e = "Down",
	u = "Up",
	i = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- 	-- Send C-a when pressing C-a twice
	{ key = "a", mods = "LEADER|CTRL", action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "c", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
	{ key = "phys:Space", mods = "LEADER", action = wezterm.action.ActivateCommandPalette },
	{ key = "k", mods = "CMD", action = wezterm.action.ClearScrollback("ScrollbackAndViewport") },

	-- Make Option-Right equivalent to Alt-f; forward-word
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
	{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },

	-- workspace
	{ key = "w", mods = "LEADER", action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },

	-- rename tab
	{
		key = "r",
		mods = "CMD",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},

	-- splits
	{ key = "-", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "|", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "q", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	{ key = "o", mods = "LEADER", action = wezterm.action.RotatePanes("Clockwise") },

	-- move between split panes
	split_nav("move", "n"),
	split_nav("move", "e"),
	split_nav("move", "u"),
	split_nav("move", "i"),
	-- resize panes
	split_nav("resize", "LeftArrow"),
	split_nav("resize", "DownArrow"),
	split_nav("resize", "UpArrow"),
	split_nav("resize", "RightArrow"),

	-- toggle bw nvim and terminal
	{
		key = ";",
		mods = "CTRL",
		action = wezterm.action_callback(function(window, pane)
			local tab = window:active_tab()

			-- Open pane below if current pane is vim
			if is_vim(pane) then
				if (#tab:panes()) == 1 then
					-- Open pane below if when there is only one pane and it is vim
					pane:split({ direction = "Bottom" })
				else
					-- Send `CTRL-; to vim`, navigate to bottom pane from vim
					window:perform_action({
						SendKey = { key = ";", mods = "CTRL" },
					}, pane)
				end
				return
			end

			-- Zoom to vim pane if it exists
			local vim_pane = find_vim_pane(tab)
			if vim_pane then
				vim_pane:activate()
				tab:set_zoomed(true)
			end
		end),
	},
}

local function create_project_tab(window, name, dir)
	local tab, pane, window = window:spawn_tab({
		cwd = wezterm.home_dir .. dir,
		tab_title = name,
	})

	tab:set_title(name)
end

--  setup some default WORKSPACES
wezterm.on("gui-startup", function(cmd)
	-- allow `wezterm start -- something` to affect what we spawn
	-- in our initial window
	local args = {}
	if cmd then
		args = cmd.args
	end

	-- main workspace for non-project tasks
	local tab, pane, window = mux.spawn_window({
		workspace = "main",
		args = args,
	})

	tab:set_title("main")

	-- Creaet tab for each project
	-- create_project_tab(window, "utilistrate", "/projects/utilistrate")
	-- create_project_tab(window, "doc", "/projects/doc/provider-portal/src")
	-- create_project_tab(window, "charbroil", "/projects/char-broil")
	-- create_project_tab(window, "vidarpm", "/projects/vidarpm")

	-- We want to startup in the coding workspace
	mux.set_active_workspace("main")
end)

-- and finally, return the configuration to wezterm
return config
