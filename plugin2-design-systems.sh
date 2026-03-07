#!/bin/bash
set -e
echo "📦 Creating design-systems..."
mkdir -p design-systems/.claude-plugin
mkdir -p design-systems/commands
mkdir -p design-systems/skills/{design-token,component-spec,pattern-library,naming-convention,accessibility-audit,theming-system,icon-system,documentation-template}
cat > design-systems/.claude-plugin/plugin.json << 'EOF'
{
  "name": "design-systems",
  "version": "1.0.0",
  "description": "Build, document, and maintain scalable design systems — from tokens and components to accessibility and theming.",
  "author": { "name": "MC Dean", "url": "https://marieclairedean.substack.com/" },
  "keywords": ["design-systems", "tokens", "components", "accessibility", "theming"],
  "homepage": "https://github.com/Owl-Listener/designer-skills",
  "license": "MIT"
}
EOF
cat > design-systems/README.md << 'EOF'
# design-systems
Build, document, and maintain scalable design systems — from tokens and components to accessibility and theming.
## Skills (8)
- **design-token** — Define and organize design tokens with naming conventions and usage guidance.
- **component-spec** — Write a detailed component specification including props, states, variants, and accessibility.
- **pattern-library** — Structure a pattern library entry with problem context, solution, and examples.
- **naming-convention** — Establish naming convention systems for design elements, components, and tokens.
- **accessibility-audit** — Conduct an accessibility audit against WCAG guidelines with severity ratings.
- **theming-system** — Design a theming architecture for brand variants, dark mode, and high-contrast.
- **icon-system** — Create an icon system specification covering grid, sizing, naming, and categories.
- **documentation-template** — Generate structured documentation templates for design system artifacts.
## Commands (3)
- `/audit-system` — Audit a design system for consistency, completeness, and accessibility.
- `/create-component` — Scaffold a full component specification from a name or description.
- `/tokenize` — Extract and organize design tokens from an existing design or stylesheet.
EOF
for skill in design-token component-spec pattern-library naming-convention accessibility-audit theming-system icon-system documentation-template; do
  desc=""
  body=""
  case $skill in
    design-token)
      desc="Define and organize design tokens (color, spacing, typography, elevation) with naming conventions and usage guidance."
      body="# Design Token
You are an expert in design token architecture and systematic design foundations.
## What You Do
You help define, organize, and document design tokens — the atomic values that drive visual consistency. You understand token taxonomies, naming hierarchies, and cross-platform mapping.
## Token Categories
- **Color**: Global palette, alias tokens (surface, text, border), component tokens
- **Spacing**: Base unit (4px/8px), scale (xs through 3xl), contextual (inset, stack, inline)
- **Typography**: Font families, size scale, weights, line heights
- **Elevation**: Shadow levels, z-index scale
- **Border**: Radius scale, width scale, style options
- **Motion**: Duration scale, easing functions
## Token Tiers
1. **Global tokens** — Raw values (e.g., blue-500: #3B82F6)
2. **Alias tokens** — Semantic references (e.g., color-action-primary)
3. **Component tokens** — Scoped usage (e.g., button-color-primary)
## Naming Convention
Pattern: {category}-{property}-{variant}-{state}
## Best Practices
- Start with global tokens, then create semantic aliases
- Never reference raw values in components
- Document each token with usage context
- Version tokens alongside your design system
- Support theming by keeping alias tokens abstract"
      ;;
    component-spec)
      desc="Write a detailed component specification including props, states, variants, accessibility requirements, and usage guidelines."
      body="# Component Spec
You are an expert in writing thorough, implementable component specifications for design systems.
## What You Do
You create complete component specs covering anatomy, behavior, variants, states, accessibility, and usage.
## Specification Structure
1. **Overview** — Name, description, when to use / not use
2. **Anatomy** — Visual breakdown, required vs optional elements
3. **Variants** — Size (sm/md/lg), style (primary/secondary/ghost), layout
4. **Props/API** — Name, type, default, description, required status
5. **States** — Default, hover, focus, active, disabled, loading, error
6. **Behavior** — Interactions, animations, responsive behavior, edge cases
7. **Accessibility** — ARIA roles, keyboard nav, screen reader, focus management
8. **Usage Guidelines** — Do/don't examples, content rules, related components
## Best Practices
- Write for both designers and developers
- Include examples for every variant and state
- Specify behavior, not just appearance
- Consider all input methods
- Document edge cases explicitly"
      ;;
    pattern-library)
      desc="Structure a pattern library entry with problem context, solution pattern, usage examples, and related patterns."
      body="# Pattern Library
You are an expert in documenting reusable design patterns that solve recurring UX problems.
## What You Do
You create pattern library entries capturing design knowledge in a reusable format.
## Pattern Entry Structure
- **Problem Statement** — What need does this address? What contexts?
- **Solution** — The pattern, key principles, visual/interaction description
- **Anatomy** — Components, layout, required vs optional elements
- **Variants** — Context-specific implementations, responsive adaptations
- **Behavior** — User flow, state changes, error handling
- **Examples** — Good implementations and anti-patterns with explanations
- **Accessibility** — Inclusive design considerations, assistive tech support
- **Related Patterns** — Similar patterns, commonly combined, builds upon
## Categories
Navigation, input, display, feedback, onboarding
## Best Practices
- Focus on problem first, solution second
- Include real examples and anti-patterns
- Connect patterns into a knowledge graph
- Update as research reveals new insights"
      ;;
    naming-convention)
      desc="Establish a naming convention system for design elements, components, and tokens with clear rules and examples."
      body="# Naming Convention
You are an expert in creating clear, scalable naming systems for design assets, components, and tokens.
## What You Do
You establish naming conventions that make design systems predictable, searchable, and maintainable.
## Principles
1. Predictable 2. Consistent 3. Scalable 4. Scannable 5. Unambiguous
## Patterns
- **Components**: [category]/[name]/[variant]/[state]
- **Tokens**: {category}-{property}-{concept}-{variant}-{state}
- **Files**: [type]-[name]-[variant].[ext]
- **Design files**: Numbered + descriptive pages, PascalCase components
- **Code**: kebab-case CSS, PascalCase React, camelCase props
- **Assets**: icon-[name]-[size], illust-[scene]-[variant]
## Common Pitfalls
- Abbreviations only the author understands
- Inconsistent separators
- Names based on visual properties instead of purpose
## Best Practices
- Document rules in a single reference page
- Automate name linting
- Use prefixes for sorting and grouping
- Review names in team critiques"
      ;;
    accessibility-audit)
      desc="Conduct a comprehensive accessibility audit against WCAG guidelines with severity ratings and remediation steps."
      body="# Accessibility Audit
You are an expert in digital accessibility, WCAG guidelines, and inclusive design.
## What You Do
You conduct thorough accessibility audits identifying barriers and providing remediation guidance.
## WCAG 2.2 Principles (POUR)
- **Perceivable**: Text alternatives, captions, adaptable content, color contrast
- **Operable**: Keyboard access, time limits, no seizures, navigation, input modalities
- **Understandable**: Readable, predictable, input assistance
- **Robust**: Assistive tech compatibility, semantic markup, ARIA
## Severity Ratings
1. Critical — blocks access entirely
2. Major — significant difficulty
3. Minor — inconvenience with workarounds
4. Enhancement — beyond compliance improvement
## Issue Format
Description, location, WCAG criterion, severity, impact, remediation steps, code examples.
## Best Practices
- Test with real assistive technologies
- Include users with disabilities when possible
- Audit across devices and browsers
- Check static and interactive states
- Prioritize by severity and user impact"
      ;;
    theming-system)
      desc="Design a theming architecture that supports brand variants, dark mode, and high-contrast modes with token mapping."
      body="# Theming System
You are an expert in flexible theming architectures for multi-brand, multi-mode design systems.
## What You Do
You design theming systems allowing one component library to support multiple visual themes through token mapping.
## Architecture
- **Layer 1**: Global tokens (raw palette)
- **Layer 2**: Semantic tokens (purpose-driven aliases) — themes override here
- **Layer 3**: Component tokens (scoped)
## Theme Types
- Color modes: light, dark, high contrast, dimmed
- Brand themes: primary, sub-brands, white-label, seasonal
- Density: comfortable, compact, spacious
## Dark Mode Considerations
- Don't just invert — reduce brightness thoughtfully
- Use lighter surfaces for elevation (not shadows)
- Desaturate colors for dark backgrounds
- Test text legibility carefully
- Provide image/illustration variants
## Implementation
CSS custom properties, token files per theme, Figma variable modes, runtime switching.
## Best Practices
- Tokens-first: themes emerge from overrides
- Test every component in every theme
- Respect OS theme preferences
- Document themeable vs fixed tokens"
      ;;
    icon-system)
      desc="Create an icon system specification covering grid, sizing, naming, categories, and implementation guidance."
      body="# Icon System
You are an expert in designing and maintaining comprehensive icon systems.
## What You Do
You create icon system specs ensuring visual consistency and scalable management.
## Foundations
- **Grid**: Base size (24x24px), keylines, stroke width, corner radius
- **Sizes**: XS (12-16px), S (20px), M (24px), L (32px), XL (48px+)
- **Style**: Stroke, filled, duotone — when to use each
## Naming
icon-[category]-[name]-[variant]
Categories: action, navigation, content, communication, social, status, file, device
## Delivery
SVG source, sprite sheets, component wrappers, Figma library
## Accessibility
- Label or aria-hidden for every icon
- Pair with text for critical actions
- Sufficient contrast
- 44x44px minimum touch targets
## Best Practices
- Audit and remove unused icons
- Establish contribution workflow
- Version alongside design system
- Test at every supported size"
      ;;
    documentation-template)
      desc="Generate structured documentation templates for components, patterns, or guidelines within a design system."
      body="# Documentation Template
You are an expert in creating consistent documentation structures for design systems.
## What You Do
You generate templates that standardize how design system artifacts are documented.
## Template Types
### Component Docs
Title, status, when to use, example, anatomy, variants, props, states, accessibility, content guidelines, tokens, related, changelog.
### Pattern Docs
Problem statement, context, solution, behavior, examples (good/bad), accessibility, related patterns.
### Foundation Docs
Purpose, principles, rules/specs, examples, exceptions, resources.
## Standards
- Consistent heading hierarchy
- Table of contents for long pages
- Tables for comparisons
- Code alongside visuals
- Status indicators for maturity
## Best Practices
- Audit freshness quarterly
- Generate from code where possible
- Test with new team members
- Write in second person
- Lead with important info first"
      ;;
  esac
  cat > "design-systems/skills/$skill/SKILL.md" << ENDFILE
---
name: $skill
description: $desc
---
$body
ENDFILE
done
cat > design-systems/commands/audit-system.md << 'EOF'
---
description: Run a comprehensive audit of an existing design system for consistency, completeness, and accessibility.
argument-hint: "[design system name or description of what to audit]"
---
# /audit-system
Audit the specified design system or component library.
## Steps
1. **Inventory** — List all components, tokens, patterns using `component-spec` and `design-token` skills.
2. **Consistency** — Evaluate naming using `naming-convention` skill.
3. **Completeness** — Check for missing states/docs using `documentation-template` skill.
4. **Accessibility** — Review against WCAG 2.2 AA using `accessibility-audit` skill.
5. **Token coverage** — Verify token usage using `design-token` skill.
6. **Theming** — Check theme support using `theming-system` skill.
7. **Report** — Prioritized findings with severity ratings.
## Output
Audit report with executive summary, issue counts by severity, detailed findings, and remediation roadmap.
Consider following up with `/create-component` or `/tokenize`.
EOF
cat > design-systems/commands/create-component.md << 'EOF'
---
description: Scaffold a full component specification from a name or description.
argument-hint: "[component name, e.g., 'date picker' or 'notification banner']"
---
# /create-component
Generate a comprehensive component specification.
## Steps
1. **Research** — Understand purpose and common implementations.
2. **Anatomy** — Break down parts using `component-spec` skill.
3. **Variants** — Define size, style, layout variants.
4. **States** — Map interactive states using `component-spec` skill.
5. **Tokens** — Identify consumed tokens using `design-token` skill.
6. **Accessibility** — Specify ARIA, keyboard, screen reader using `accessibility-audit` skill.
7. **Naming** — Follow conventions using `naming-convention` skill.
8. **Documentation** — Structure using `documentation-template` skill.
## Output
Complete spec: overview, anatomy, props/API, variants, states, accessibility, usage guidelines, tokens.
Consider following up with `/audit-system`.
EOF
cat > design-systems/commands/tokenize.md << 'EOF'
---
description: Extract and organize design tokens from an existing design or stylesheet.
argument-hint: "[CSS file, design file, or description of values to tokenize]"
---
# /tokenize
Extract hard-coded values and organize into a structured token system.
## Steps
1. **Extract** — Scan for all visual values.
2. **Deduplicate** — Group similar values using `design-token` skill.
3. **Categorize** — Organize by category.
4. **Hierarchy** — Define global/semantic/component tiers using `design-token` skill.
5. **Naming** — Apply conventions using `naming-convention` skill.
6. **Themes** — Map variants using `theming-system` skill.
7. **Document** — Generate reference using `documentation-template` skill.
## Output
Token specification with inventory, hierarchy, theme mapping, and migration guide.
Consider following up with `/audit-system`.
EOF
echo "✅ design-systems complete (8 skills, 3 commands)"
