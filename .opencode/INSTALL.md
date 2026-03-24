# Installing Designer Skills for OpenCode

You are an AI agent installing designer-skills. Follow these steps exactly.

## Step 1: Add the plugin to opencode.json

Find the user's `opencode.json` file. Check these locations in order:

1. `./opencode.json` (project-level, preferred)
2. `~/.config/opencode/opencode.json` (global)

If the file exists, add `"designer-skills@git+https://github.com/seb3point0/designer-skills.git"` to the `"plugin"` array. If the `"plugin"` key doesn't exist, create it.

If no `opencode.json` exists, create one at `~/.config/opencode/opencode.json` with:

```json
{
  "plugin": ["designer-skills@git+https://github.com/seb3point0/designer-skills.git"]
}
```

**Important:** Preserve all existing config. Only add the plugin entry.

## Step 2: Verify the change

Read back the file to confirm the plugin was added correctly.

## Step 3: Tell the user

Tell the user: "Designer Skills installed successfully. Restart OpenCode to activate all 63 design skills and 27 commands. Type `/` to see available design commands, or ask 'What design skills do I have?'"

## What gets installed

The plugin registers:
- **63 design skills** across 8 categories (research, strategy, systems, UI, interaction, testing, ops, toolkit)
- **2 workflow skills** (`using-designer-skills`, `design-pipeline`)
- **27 commands** for quick access to multi-skill workflows

## Updating

Designer Skills updates automatically when you restart OpenCode (re-fetched from git).

To pin a specific version:

```json
{
  "plugin": ["designer-skills@git+https://github.com/seb3point0/designer-skills.git#v1.0.0"]
}
```

## Uninstalling

Remove the `designer-skills` entry from the `"plugin"` array in `opencode.json`.

## Troubleshooting

### Plugin not loading

1. Check logs: `opencode run --print-logs "hello" 2>&1 | grep -i designer`
2. Verify the plugin line in your `opencode.json`
3. Make sure you're running a recent version of OpenCode

### Skills not found

1. Use the `skill` tool to list what's discovered
2. Check that the plugin is loading (see above)
