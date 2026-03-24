# Installing Designer Skills for Codex

You are an AI agent installing designer-skills. Follow these steps exactly.

## Step 1: Clone the repository

Run this command:

```bash
git clone https://github.com/seb3point0/designer-skills.git ~/.codex/designer-skills
```

If the directory already exists, update it instead:

```bash
cd ~/.codex/designer-skills && git pull
```

## Step 2: Create skill symlinks

Run the install script:

```bash
bash ~/.codex/designer-skills/scripts/install-codex.sh
```

This creates symlinks in `~/.agents/skills/` for all 63 design skills so Codex discovers them automatically.

## Step 3: Verify

Run:

```bash
ls ~/.agents/skills/ | head -20
```

You should see skill directories like `user-persona`, `color-system`, `design-pipeline`, etc.

## Step 4: Tell the user

Tell the user: "Designer Skills installed successfully. Restart Codex to discover all 63 design skills. Type `$` or `/skills` to see them."

## What was installed

- **63 design skills** across 8 categories (research, strategy, systems, UI, interaction, testing, ops, toolkit)
- **2 workflow skills** (`using-designer-skills`, `design-pipeline`)

## Updating

```bash
cd ~/.codex/designer-skills && git pull
```

Skills update instantly through the symlinks.

## Uninstalling

```bash
bash ~/.codex/designer-skills/scripts/uninstall-codex.sh
rm -rf ~/.codex/designer-skills
```
