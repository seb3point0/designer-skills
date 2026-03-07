#!/bin/bash
set -e
echo "📝 Updating root README..."
cat > README.md << 'EOF'
# Designer Skills Collection
Agentic skills, commands, and plugins for design — from research to systems, UI, interaction, and delivery.
**63 skills** and **27 commands** across **8 plugins** for [Claude Code](https://docs.anthropic.com/en/docs/claude-code).
## Plugins
| Plugin | Skills | Commands | Description |
|--------|--------|----------|-------------|
| [design-research](./design-research) | 10 | 4 | User research: personas, empathy maps, journey maps, interviews, usability testing, and card sorting. |
| [design-systems](./design-systems) | 8 | 3 | Build and maintain design systems: tokens, components, accessibility, theming, and documentation. |
| [ux-strategy](./ux-strategy) | 8 | 3 | Shape product direction: competitive analysis, design principles, experience mapping, and alignment. |
| [ui-design](./ui-design) | 9 | 4 | Craft polished interfaces: layout grids, color systems, typography, responsive design, and data viz. |
| [interaction-design](./interaction-design) | 7 | 3 | Design meaningful interactions: micro-animations, state machines, gestures, error handling, and feedback. |
| [prototyping-testing](./prototyping-testing) | 8 | 4 | Validate designs: prototyping strategies, usability testing, heuristic evaluation, and A/B experiments. |
| [design-ops](./design-ops) | 7 | 3 | Streamline operations: critique frameworks, handoff specs, sprint planning, and team workflows. |
| [designer-toolkit](./designer-toolkit) | 6 | 3 | Essential utilities: design rationale, presentations, case studies, UX writing, and system adoption. |
## Quick Start
### Install a Single Plugin
```bash
claude install github:Owl-Listener/designer-skills/design-research
```
### Install All Plugins
```bash
claude install github:Owl-Listener/designer-skills
```
## What Are Skills and Commands?
- **Skills** are domain knowledge units (nouns). They teach Claude about a design topic — like creating user personas, defining design tokens, or writing error messages.
- **Commands** are workflows (verbs). They chain multiple skills together to accomplish a task — like running a full design system audit or planning a usability test.
## All Commands
| Command | Plugin | Description |
|---------|--------|-------------|
| `/discover` | design-research | Run a full user research discovery cycle. |
| `/interview` | design-research | Prepare and conduct a user interview. |
| `/test-plan` | design-research | Create a usability test plan. |
| `/synthesize` | design-research | Synthesize research data into insights. |
| `/audit-system` | design-systems | Audit a design system for consistency and accessibility. |
| `/create-component` | design-systems | Scaffold a full component specification. |
| `/tokenize` | design-systems | Extract and organize design tokens. |
| `/strategize` | ux-strategy | Develop a complete UX strategy. |
| `/benchmark` | ux-strategy | Run a competitive benchmarking analysis. |
| `/frame-problem` | ux-strategy | Structure an ambiguous challenge into a clear problem. |
| `/design-screen` | ui-design | Design a complete screen layout. |
| `/color-palette` | ui-design | Generate a full color palette with accessibility checks. |
| `/type-system` | ui-design | Create a complete typography system. |
| `/responsive-audit` | ui-design | Audit a design for responsive behavior. |
| `/design-interaction` | interaction-design | Design a complete interaction flow. |
| `/map-states` | interaction-design | Model states and transitions for a component. |
| `/error-flow` | interaction-design | Design error handling for a feature. |
| `/prototype-plan` | prototyping-testing | Create a prototyping and testing plan. |
| `/evaluate` | prototyping-testing | Run a heuristic evaluation. |
| `/test-plan` | prototyping-testing | Design a complete usability testing plan. |
| `/experiment` | prototyping-testing | Design an A/B experiment. |
| `/plan-sprint` | design-ops | Plan a design sprint. |
| `/handoff` | design-ops | Generate a developer handoff package. |
| `/setup-workflow` | design-ops | Set up a design team workflow. |
| `/write-rationale` | designer-toolkit | Write design rationale for decisions. |
| `/build-presentation` | designer-toolkit | Structure a design presentation. |
| `/write-case-study` | designer-toolkit | Create a portfolio case study. |
## Contributing
See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines on adding new skills, commands, and plugins.
## License
MIT — see [LICENSE](./LICENSE).
EOF
echo "✅ README updated"
