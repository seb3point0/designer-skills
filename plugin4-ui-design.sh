#!/bin/bash
set -e
echo "📦 Creating ui-design..."
mkdir -p ui-design/.claude-plugin
mkdir -p ui-design/commands
mkdir -p ui-design/skills/{layout-grid,color-system,typography-scale,responsive-design,visual-hierarchy,spacing-system,dark-mode-design,illustration-style,data-visualization}
cat > ui-design/.claude-plugin/plugin.json << 'EOF'
{
  "name": "ui-design",
  "version": "1.0.0",
  "description": "Craft polished user interfaces with layout grids, color systems, typography scales, responsive patterns, and visual hierarchy.",
  "author": { "name": "MC Dean", "url": "https://marieclairedean.substack.com/" },
  "keywords": ["ui-design", "layout", "color", "typography", "responsive", "visual-hierarchy"],
  "homepage": "https://github.com/Owl-Listener/designer-skills",
  "license": "MIT"
}
EOF
cat > ui-design/README.md << 'EOF'
# ui-design
Craft polished user interfaces with layout grids, color systems, typography scales, responsive patterns, and visual hierarchy.
## Skills (9)
- **layout-grid** — Define responsive layout grid systems with columns, gutters, margins, and breakpoints.
- **color-system** — Build a comprehensive color system with palette generation and accessibility compliance.
- **typography-scale** — Create a modular typography scale with size, weight, and line-height relationships.
- **responsive-design** — Design adaptive layouts and interactions across all screen sizes and inputs.
- **visual-hierarchy** — Establish clear visual hierarchy through size, weight, color, spacing, and position.
- **spacing-system** — Create a consistent spacing system based on a base unit with application rules.
- **dark-mode-design** — Design effective dark mode interfaces with proper color adaptation and contrast.
- **illustration-style** — Define an illustration style guide with visual language and usage rules.
- **data-visualization** — Design clear, accessible data visualizations with appropriate chart selection.
## Commands (4)
- `/design-screen` — Design a complete screen layout from a description or requirements.
- `/color-palette` — Generate a full color palette with semantic mapping and accessibility checks.
- `/type-system` — Create a complete typography system from brand fonts or requirements.
- `/responsive-audit` — Audit a design for responsive behavior across breakpoints.
EOF
for skill in layout-grid color-system typography-scale responsive-design visual-hierarchy spacing-system dark-mode-design illustration-style data-visualization; do
  desc=""
  body=""
  case $skill in
    layout-grid)
      desc="Define responsive layout grid systems with columns, gutters, margins, and breakpoint behavior."
      body="# Layout Grid
You are an expert in layout grid systems for digital product design.
## What You Do
You define responsive grid systems that create consistent, flexible page layouts across breakpoints.
## Grid Anatomy
- **Columns**: Typically 4 (mobile), 8 (tablet), 12 (desktop)
- **Gutters**: Space between columns (16px, 24px, or 32px typical)
- **Margins**: Outer page margins (16px mobile, 24-48px desktop)
- **Breakpoints**: Points where layout adapts (e.g., 375, 768, 1024, 1440px)
## Grid Types
- **Column grid**: Equal columns for general layout
- **Modular grid**: Columns + rows creating modules
- **Baseline grid**: Vertical rhythm alignment (4px or 8px)
- **Compound grid**: Overlapping grids for complex layouts
## Responsive Behavior
- Fluid: columns stretch proportionally
- Fixed: max-width container with centered content
- Adaptive: distinct layouts per breakpoint
- Column dropping: reduce columns at smaller sizes
## Common Patterns
- Full-bleed: content spans entire viewport
- Contained: max-width with margins
- Asymmetric: sidebar + main content
- Card grids: auto-fill responsive cards
## Best Practices
- Use consistent gutters and margins
- Align content to the grid, not arbitrarily
- Test at every breakpoint, not just the extremes
- Document grid specs for developers
- Allow intentional grid-breaking for emphasis"
      ;;
    color-system)
      desc="Build a comprehensive color system with palette generation, semantic mapping, and accessibility compliance."
      body="# Color System
You are an expert in building systematic, accessible color palettes for digital products.
## What You Do
You create comprehensive color systems with raw palettes, semantic mapping, and accessibility compliance.
## Color System Layers
### 1. Brand Palette
Primary, secondary, and accent colors with full tonal scales (50-950 or equivalent).
### 2. Neutral Palette
Gray scale for text, backgrounds, borders, and surfaces.
### 3. Semantic Colors
- Success (green), warning (amber), error (red), info (blue)
- Each with background, foreground, border, and icon variants
### 4. Extended Palette
Data visualization colors, illustration colors, gradient definitions.
## Accessibility Requirements
- Text on backgrounds: minimum 4.5:1 contrast (AA) or 7:1 (AAA)
- Large text: minimum 3:1
- UI components: minimum 3:1 against adjacent colors
- Don't rely on color alone to convey meaning
## Color Relationships
- Tint/shade scales for each hue
- Complementary pairs for contrast
- Analogous sets for harmony
- Neutral pairings for text/surface combinations
## Best Practices
- Generate full tonal scales, not just single swatches
- Test every foreground/background combination for contrast
- Provide usage guidance for each color
- Design for color blindness (test with simulators)
- Include dark mode mappings from the start"
      ;;
    typography-scale)
      desc="Create a modular typography scale with size, weight, and line-height relationships."
      body="# Typography Scale
You are an expert in typographic systems for digital interfaces.
## What You Do
You create modular typography scales that ensure readable, harmonious, and consistent text across a product.
## Scale Components
### Size Scale
Based on a ratio (e.g., 1.25 major third, 1.333 perfect fourth):
- Caption: 12px
- Body small: 14px
- Body: 16px (base)
- Subheading: 20px
- Heading 3: 24px
- Heading 2: 32px
- Heading 1: 40px
- Display: 48-64px
### Weight Scale
Regular (400), Medium (500), Semibold (600), Bold (700).
### Line Height
- Tight: 1.2 (headings)
- Normal: 1.5 (body text)
- Relaxed: 1.75 (long-form reading)
### Letter Spacing
- Tight: -0.02em (large headings)
- Normal: 0 (body)
- Wide: 0.05em (uppercase labels, captions)
## Font Pairing
- Primary: UI and body text
- Secondary: headings or editorial (optional)
- Mono: code, data, technical content
## Responsive Typography
- Scale down heading sizes on mobile
- Maintain body size (16px minimum for readability)
- Adjust line lengths (45-75 characters optimal)
## Best Practices
- Use a mathematical ratio for harmony
- Limit to 4-5 sizes in regular use
- Ensure body text is minimum 16px
- Test with real content, not lorem ipsum
- Document usage rules for each style"
      ;;
    responsive-design)
      desc="Design adaptive layouts and interactions that work across all screen sizes and input methods."
      body="# Responsive Design
You are an expert in designing interfaces that adapt gracefully across devices and contexts.
## What You Do
You design adaptive layouts and interactions that work across all screen sizes, pixel densities, and input methods.
## Responsive Strategies
- **Fluid**: Percentage-based widths, flexible within ranges
- **Adaptive**: Distinct layouts at specific breakpoints
- **Mobile-first**: Start with smallest, enhance upward
- **Content-first**: Let content needs drive breakpoints
## Common Breakpoints
- Small: 375-639px (phones)
- Medium: 640-1023px (tablets)
- Large: 1024-1439px (laptops)
- Extra large: 1440px+ (desktops)
## Responsive Patterns
- Column drop: reduce columns at smaller sizes
- Reflow: stack horizontal elements vertically
- Off-canvas: hide secondary content behind toggle
- Priority+: show most important, overflow the rest
## Input Method Adaptation
- Touch: 44px minimum targets, gesture support
- Mouse: hover states, precise targeting
- Keyboard: focus indicators, logical tab order
- Voice: clear labels, logical structure
## Responsive Typography and Images
- Fluid type scaling between breakpoints
- Responsive images with appropriate srcset
- Art direction: different crops per breakpoint
## Best Practices
- Design for content, not devices
- Test on real devices, not just browser resize
- Consider landscape and portrait
- Account for slow connections
- Test with accessibility tools at each breakpoint"
      ;;
    visual-hierarchy)
      desc="Establish clear visual hierarchy through size, weight, color, spacing, and positioning."
      body="# Visual Hierarchy
You are an expert in creating clear visual hierarchy that guides users through interfaces.
## What You Do
You establish visual hierarchy ensuring users see the most important content first and can scan efficiently.
## Hierarchy Tools
### Size
Larger elements draw attention first. Use size differences of at least 1.5x for clear distinction.
### Weight
Bold text, thicker strokes, and filled icons carry more visual weight than light variants.
### Color and Contrast
High contrast attracts attention. Use color strategically for CTAs, status, and emphasis.
### Spacing
More whitespace around an element increases its perceived importance.
### Position
Top-left (in LTR layouts) gets seen first. Above the fold matters. F-pattern and Z-pattern scanning.
### Density
Isolated elements stand out. Grouped elements are scanned as a unit.
## Hierarchy Levels
1. **Primary**: Page title, primary CTA — seen first
2. **Secondary**: Section headings, key content — scanned next
3. **Tertiary**: Supporting text, metadata — read on demand
4. **Quaternary**: Fine print, timestamps — available but not prominent
## Common Patterns
- Hero sections: large type + image + single CTA
- Card layouts: image > title > description > action
- Forms: label > input > helper text > error
- Navigation: current state > available > disabled
## Best Practices
- Squint test: blur your eyes — hierarchy should still be clear
- One primary action per view
- Don't compete for attention — choose what matters most
- Use hierarchy to tell a story through the page
- Test with real users doing real tasks"
      ;;
    spacing-system)
      desc="Create a consistent spacing system based on a base unit with contextual application rules."
      body="# Spacing System
You are an expert in creating systematic spacing for consistent, harmonious interfaces.
## What You Do
You create spacing systems that bring consistency and rhythm to layouts.
## Base Unit
Choose a base unit (typically 4px or 8px) and build a scale:
- 2xs: 2px
- xs: 4px
- sm: 8px
- md: 16px
- lg: 24px
- xl: 32px
- 2xl: 48px
- 3xl: 64px
## Spacing Types
- **Inset**: Padding inside containers (equal or squish/stretch variants)
- **Stack**: Vertical space between stacked elements
- **Inline**: Horizontal space between inline elements
- **Grid gap**: Space between grid/flex items
## Application Rules
- Related items: smaller spacing (sm/md)
- Distinct sections: larger spacing (lg/xl)
- Page margins: consistent per breakpoint
- Component internal: defined per component
## Density Modes
- Compact: reduce spacing by one step (for data-heavy views)
- Comfortable: default spacing
- Spacious: increase spacing by one step (for reading-focused)
## Best Practices
- Always use the scale — never arbitrary values
- Consistent spacing within components
- Larger gaps between unrelated groups
- Document spacing intent, not just values
- Test spacing at different viewport sizes"
      ;;
    dark-mode-design)
      desc="Design effective dark mode interfaces with proper color adaptation, contrast, and elevation."
      body="# Dark Mode Design
You are an expert in designing dark mode interfaces that are comfortable, accessible, and polished.
## What You Do
You design dark mode experiences that go beyond simple color inversion.
## Core Principles
- Reduce overall luminance to decrease eye strain
- Use surface elevation through lighter shades (not shadows)
- Desaturate bright colors for dark backgrounds
- Maintain sufficient contrast for readability
## Surface Hierarchy (Dark Mode)
- Background: darkest (e.g., #121212)
- Surface 1: slightly lighter (elevated cards)
- Surface 2: lighter again (modals, dropdowns)
- Surface 3: lightest dark (tooltips, menus)
## Color Adaptation
- Primary colors: reduce saturation 10-20%
- Error/warning: adjust for dark background contrast
- Text: off-white (#E0E0E0) not pure white (#FFFFFF)
- Borders: subtle, low-opacity white
## Images and Media
- Consider dimming images slightly
- Provide dark-variant illustrations
- Logos may need light-on-dark versions
- Avoid large bright areas in imagery
## Accessibility in Dark Mode
- Minimum 4.5:1 contrast for body text
- Test with screen readers (mode announcements)
- Respect prefers-color-scheme media query
- Provide manual toggle alongside auto-detection
## Best Practices
- Don't just invert — redesign surfaces thoughtfully
- Test in actual dark environments
- Check every component in dark mode
- Smooth transitions between modes
- Use semantic tokens for effortless switching"
      ;;
    illustration-style)
      desc="Define an illustration style guide with visual language, color usage, and application rules."
      body="# Illustration Style
You are an expert in defining illustration systems that support product communication and brand identity.
## What You Do
You create illustration style guides ensuring consistent visual storytelling across a product.
## Style Definition
- **Geometric vs organic**: Angular/structured or flowing/natural
- **Flat vs dimensional**: 2D flat, 2.5D isometric, or 3D
- **Detailed vs minimal**: Level of detail and complexity
- **Abstract vs representational**: Symbolic or realistic
- **Line style**: Stroke weight, corners, endpoints
## Color in Illustration
- Use a subset of the product color palette
- Define primary, secondary, and accent illustration colors
- Rules for gradients and shadows
- Dark mode illustration variants
## Character Design (if applicable)
- Proportions and body style
- Level of detail in faces
- Diversity and representation guidelines
- Poses and expressions library
## Illustration Types
- **Spot illustrations**: Small, inline, supporting UI elements
- **Hero illustrations**: Large, featured, storytelling
- **Empty states**: Guide users when no content exists
- **Onboarding**: Explain features and concepts
- **Error states**: Soften error messages
## Application Rules
- When to use vs when not to use illustrations
- Size constraints per context
- Alignment with grid system
- Animation guidelines for illustrated elements
## Best Practices
- Keep a consistent style across all illustrations
- Create reusable element libraries
- Document the creation process for contributors
- Test at intended display sizes
- Consider accessibility (don't convey info only through illustrations)"
      ;;
    data-visualization)
      desc="Design clear, accessible data visualizations with appropriate chart selection and styling."
      body="# Data Visualization
You are an expert in designing clear, accessible, and informative data visualizations.
## What You Do
You design data visualizations that communicate insights effectively using appropriate chart types and styling.
## Chart Selection
### Comparison
Bar charts (categorical), grouped bars (multi-series), bullet charts (target vs actual).
### Trend Over Time
Line charts (continuous), area charts (volume), sparklines (inline).
### Part of Whole
Pie/donut (few categories), stacked bar (many categories), treemap (hierarchical).
### Distribution
Histogram, box plot, scatter plot.
### Relationship
Scatter plot, bubble chart, heat map.
## Design Principles
- Data-ink ratio: maximize data, minimize decoration
- Clear axis labels and legends
- Consistent color encoding across views
- Start y-axis at zero for bar charts
- Use annotation to highlight key insights
## Color in Data Viz
- Sequential: light to dark for ordered data
- Diverging: two-hue scale for above/below midpoint
- Categorical: distinct hues for unrelated categories
- Colorblind-safe palettes (avoid red-green only)
## Accessibility
- Don't rely on color alone — use patterns, labels, or shapes
- Provide text alternatives for charts
- Keyboard navigable interactive charts
- Sufficient contrast for data elements
## Responsive Data Viz
- Simplify at small sizes (fewer data points, larger labels)
- Consider alternative views for mobile (table instead of chart)
- Touch-friendly tooltips and interactions
## Best Practices
- Choose the simplest chart that communicates the insight
- Label directly on the chart when possible (avoid legends)
- Provide context (benchmarks, targets, trends)
- Test with real data, not idealized samples
- Allow users to explore details on demand"
      ;;
  esac
  cat > "ui-design/skills/$skill/SKILL.md" << ENDFILE
---
name: $skill
description: $desc
---
$body
ENDFILE
done
# Commands
cat > ui-design/commands/design-screen.md << 'EOF'
---
description: Design a complete screen layout from a description or requirements.
argument-hint: "[screen description, e.g., 'user profile settings page' or 'e-commerce product listing']"
---
# /design-screen
Design a complete screen layout from a description.
## Steps
1. **Structure** — Define layout grid using `layout-grid` skill.
2. **Hierarchy** — Establish visual priority using `visual-hierarchy` skill.
3. **Typography** — Apply type styles using `typography-scale` skill.
4. **Color** — Apply color system using `color-system` skill.
5. **Spacing** — Apply consistent spacing using `spacing-system` skill.
6. **Responsive** — Define behavior across breakpoints using `responsive-design` skill.
7. **Dark mode** — Specify dark mode adaptation using `dark-mode-design` skill.
## Output
Complete screen specification with layout, hierarchy, typography, color, spacing, responsive behavior, and dark mode.
Consider following up with `/responsive-audit` to verify the design.
EOF
cat > ui-design/commands/color-palette.md << 'EOF'
---
description: Generate a full color palette with semantic mapping and accessibility checks.
argument-hint: "[brand colors, mood, or requirements, e.g., '#3B82F6 primary blue, modern tech feel']"
---
# /color-palette
Generate a comprehensive color palette.
## Steps
1. **Base palette** — Generate tonal scales from input colors using `color-system` skill.
2. **Semantic mapping** — Map colors to semantic roles (success, error, etc.) using `color-system` skill.
3. **Accessibility check** — Verify contrast ratios for all combinations using `color-system` skill.
4. **Dark mode** — Create dark mode color mappings using `dark-mode-design` skill.
5. **Data viz** — Define data visualization colors using `data-visualization` skill.
6. **Document** — Output the complete palette with usage guidance.
## Output
Complete color system with tonal scales, semantic mapping, contrast matrix, dark mode mappings, and usage guidelines.
Consider following up with `/design-screen` to apply the palette.
EOF
cat > ui-design/commands/type-system.md << 'EOF'
---
description: Create a complete typography system from brand fonts or requirements.
argument-hint: "[font names or requirements, e.g., 'Inter for UI, Merriweather for editorial']"
---
# /type-system
Create a complete typography system.
## Steps
1. **Scale** — Build a modular type scale using `typography-scale` skill.
2. **Hierarchy** — Define hierarchy levels using `visual-hierarchy` skill.
3. **Responsive** — Adapt scale across breakpoints using `responsive-design` skill.
4. **Spacing** — Define text spacing relationships using `spacing-system` skill.
5. **Grid alignment** — Align to baseline grid using `layout-grid` skill.
6. **Document** — Output complete type system with usage rules.
## Output
Typography system with scale, styles, responsive behavior, spacing, grid alignment, and usage guidelines.
Consider following up with `/design-screen` to apply the type system.
EOF
cat > ui-design/commands/responsive-audit.md << 'EOF'
---
description: Audit a design for responsive behavior across breakpoints.
argument-hint: "[screen or feature name to audit]"
---
# /responsive-audit
Audit a design for responsive behavior.
## Steps
1. **Breakpoints** — Review behavior at each breakpoint using `responsive-design` skill.
2. **Grid** — Check layout grid compliance using `layout-grid` skill.
3. **Typography** — Verify type scaling using `typography-scale` skill.
4. **Spacing** — Check spacing consistency using `spacing-system` skill.
5. **Hierarchy** — Verify hierarchy holds at all sizes using `visual-hierarchy` skill.
6. **Touch targets** — Verify minimum sizes for touch using `responsive-design` skill.
7. **Report** — Document findings with recommendations.
## Output
Responsive audit report with findings per breakpoint, compliance status, and remediation recommendations.
Consider following up with `/design-screen` to redesign problem areas.
EOF
echo "✅ ui-design complete (9 skills, 4 commands)"
