#!/bin/bash
set -e
echo "📦 Creating prototyping-testing..."
mkdir -p prototyping-testing/.claude-plugin
mkdir -p prototyping-testing/commands
mkdir -p prototyping-testing/skills/{prototype-strategy,test-scenario,heuristic-evaluation,a-b-test-design,user-flow-diagram,wireframe-spec,click-test-plan,accessibility-test-plan}
cat > prototyping-testing/.claude-plugin/plugin.json << 'EOF'
{
  "name": "prototyping-testing",
  "version": "1.0.0",
  "description": "Plan and execute design validation through prototyping strategies, usability testing, heuristic evaluation, and A/B experiments.",
  "author": { "name": "MC Dean", "url": "https://marieclairedean.substack.com/" },
  "keywords": ["prototyping", "usability-testing", "heuristic-evaluation", "a-b-testing", "wireframes"],
  "homepage": "https://github.com/Owl-Listener/designer-skills",
  "license": "MIT"
}
EOF
cat > prototyping-testing/README.md << 'EOF'
# prototyping-testing
Plan and execute design validation through prototyping strategies, usability testing, heuristic evaluation, and A/B experiments.
## Skills (8)
- **prototype-strategy** — Choose the right prototyping fidelity and method for the design question.
- **test-scenario** — Write usability test scenarios with tasks, success criteria, and observation guides.
- **heuristic-evaluation** — Conduct expert heuristic evaluations using Nielsen's heuristics and domain-specific criteria.
- **a-b-test-design** — Design rigorous A/B tests with hypotheses, variants, metrics, and sample size calculations.
- **user-flow-diagram** — Create user flow diagrams showing paths, decisions, and branch logic.
- **wireframe-spec** — Specify wireframe layouts with content priority, component placement, and annotation.
- **click-test-plan** — Design click/first-click tests to evaluate navigation and information findability.
- **accessibility-test-plan** — Create accessibility testing plans covering assistive technologies and WCAG criteria.
## Commands (4)
- `/prototype-plan` — Create a prototyping and testing plan for a design initiative.
- `/evaluate` — Run a heuristic evaluation of an existing design.
- `/test-plan` — Design a complete usability testing plan.
- `/experiment` — Design an A/B experiment for a design hypothesis.
EOF
for skill in prototype-strategy test-scenario heuristic-evaluation a-b-test-design user-flow-diagram wireframe-spec click-test-plan accessibility-test-plan; do
  desc=""
  body=""
  case $skill in
    prototype-strategy)
      desc="Choose the right prototyping fidelity and method for the design question."
      body="# Prototype Strategy
You are an expert in choosing prototyping approaches that efficiently answer design questions.
## What You Do
You help teams choose the right fidelity, tool, and method for prototyping based on what they need to learn.
## Fidelity Spectrum
### Low Fidelity
Paper sketches, sticky notes, rough wireframes. Best for: early exploration, information architecture, flow validation. Fast to create, easy to discard.
### Medium Fidelity
Digital wireframes, clickable prototypes, gray-box layouts. Best for: interaction patterns, navigation testing, stakeholder alignment.
### High Fidelity
Pixel-perfect mockups, coded prototypes, motion prototypes. Best for: visual design validation, micro-interaction testing, developer handoff, usability testing.
## Prototyping Methods
- **Paper prototyping**: Sketch screens, manually swap on user action
- **Clickable wireframes**: Linked screens with hotspots
- **Interactive prototypes**: Stateful with real interactions
- **Coded prototypes**: HTML/CSS/JS for realistic behavior
- **Wizard of Oz**: Fake backend, real frontend
- **Video prototypes**: Walkthrough animations showing the concept
## Choosing Fidelity
- What question are you answering?
- Who is the audience (users, stakeholders, developers)?
- How much time do you have?
- How many iterations do you expect?
- What decisions will this prototype inform?
## Best Practices
- Match fidelity to the question, not the deadline
- Prototype the riskiest assumption first
- Don't over-invest before testing
- Make it clear it is a prototype (avoid polished for early feedback)
- Plan for iteration — build to throw away"
      ;;
    test-scenario)
      desc="Write usability test scenarios with tasks, success criteria, and observation guides."
      body="# Test Scenario
You are an expert in writing usability test scenarios that reveal genuine user behavior.
## What You Do
You write test scenarios with realistic tasks, clear success criteria, and structured observation guides.
## Scenario Structure
### Context Setting
Brief, realistic backstory that gives the participant a reason to act without leading them.
### Task
Specific goal to accomplish. Action-oriented, not question-based. Avoids UI terminology that hints at the answer.
### Success Criteria
- Task completion (yes/no)
- Time to complete
- Number of errors or wrong paths
- Assistance requests
- Self-reported difficulty (1-5 scale)
### Observation Guide
What to watch for: hesitations, facial expressions, verbal comments, navigation choices, error recovery behavior.
## Task Types
- **Exploratory**: Find information (e.g., 'Find the return policy')
- **Specific**: Complete a goal (e.g., 'Add a blue shirt size M to your cart')
- **Comparative**: Choose between options
- **Open-ended**: Achieve a goal with multiple valid paths
## Scenario Writing Rules
- Use participant's language, not product jargon
- Give motivation, not instructions
- One goal per task
- Don't reveal the UI path in the task wording
- Include both simple and complex tasks
## Best Practices
- Pilot test your scenarios before real sessions
- Order tasks from easy to hard
- Include a warm-up task
- Prepare follow-up questions per task
- Write more scenarios than you need (allow flexibility)"
      ;;
    heuristic-evaluation)
      desc="Conduct expert heuristic evaluations using Nielsen's heuristics and domain-specific criteria."
      body="# Heuristic Evaluation
You are an expert in conducting systematic heuristic evaluations of digital interfaces.
## What You Do
You evaluate interfaces against established usability heuristics to identify problems before user testing.
## Nielsen's 10 Usability Heuristics
1. **Visibility of system status** — Users know what is happening
2. **Match real world** — System speaks users' language
3. **User control and freedom** — Easy undo and exit
4. **Consistency and standards** — Follow conventions
5. **Error prevention** — Prevent problems before they occur
6. **Recognition over recall** — Make options visible
7. **Flexibility and efficiency** — Shortcuts for experts
8. **Aesthetic and minimalist design** — No irrelevant information
9. **Error recovery** — Help users recognize and recover from errors
10. **Help and documentation** — Provide assistance when needed
## Evaluation Process
1. Define scope (which screens/flows to evaluate)
2. Walk through as a new user
3. Walk through as an experienced user
4. Walk through each task flow
5. Document each issue found
6. Rate severity
7. Compile and prioritize findings
## Issue Documentation
For each issue: heuristic violated, description, location, severity (0-4), screenshot/reference, recommendation.
## Severity Scale
- 0: Not a usability problem
- 1: Cosmetic only
- 2: Minor problem
- 3: Major problem (important to fix)
- 4: Catastrophe (must fix before release)
## Best Practices
- Multiple evaluators find more issues (3-5 ideal)
- Evaluate independently before comparing
- Focus on real user tasks, not edge cases
- Don't just find problems — suggest solutions
- Combine with real user testing for complete picture"
      ;;
    a-b-test-design)
      desc="Design rigorous A/B tests with hypotheses, variants, metrics, and sample size calculations."
      body="# A/B Test Design
You are an expert in designing rigorous A/B experiments that produce actionable results.
## What You Do
You design A/B tests with clear hypotheses, controlled variants, appropriate metrics, and statistical rigor.
## Test Structure
### 1. Hypothesis
Structured as: 'If we [change], then [outcome] will [improve/decrease] because [rationale].'
### 2. Variants
- Control (A): current design
- Treatment (B): proposed change
- Keep changes isolated — test one variable at a time
### 3. Primary Metric
The single most important measure of success. Must be measurable, relevant, and sensitive to the change.
### 4. Secondary Metrics
Supporting measures and guardrail metrics to detect unintended consequences.
### 5. Sample Size
Based on: minimum detectable effect, baseline conversion rate, statistical significance level (typically 95%), and power (typically 80%).
### 6. Duration
Run until sample size is reached. Account for weekly cycles (run in full weeks). Minimum 1-2 weeks typically.
## Common Pitfalls
- Peeking at results before completion
- Too many variants at once
- Metric not sensitive enough to detect change
- Sample size too small
- Not accounting for novelty effects
- Ignoring segmentation effects
## When Not to A/B Test
- Very low traffic (insufficient sample)
- Ethical concerns with withholding improvement
- Foundational changes that affect everything
- When qualitative insight is more valuable
## Best Practices
- One hypothesis per test
- Document everything before starting
- Don't stop early on positive results
- Analyze segments after overall results
- Share learnings broadly regardless of outcome"
      ;;
    user-flow-diagram)
      desc="Create user flow diagrams showing paths, decisions, and branch logic."
      body="# User Flow Diagram
You are an expert in creating clear user flow diagrams that map paths through a product.
## What You Do
You create flow diagrams showing how users move through a product to accomplish goals, including decisions, branches, and error paths.
## Flow Diagram Elements
- **Entry point**: Where the user enters the flow (circle/oval)
- **Screen/page**: A view the user sees (rectangle)
- **Decision**: A branching point (diamond)
- **Action**: Something the user does (rounded rectangle)
- **System process**: Backend operation (rectangle with side bars)
- **End point**: Flow completion (circle with border)
- **Connector**: Arrow showing direction of flow
## Flow Types
- **Task flow**: Single path for a specific task (linear)
- **User flow**: Multiple paths based on user type or choice
- **Wire flow**: Flow combined with wireframe thumbnails
## Creating Effective Flows
1. Define the goal the flow accomplishes
2. Identify the entry point(s)
3. Map the happy path first
4. Add decision points and branches
5. Map error paths and recovery
6. Mark exit points
7. Note system actions happening in background
## Flow Annotations
- Screen names and key content
- Decision criteria at each branch
- Error conditions and handling
- System events and notifications
- Time delays or async processes
## Best Practices
- One flow per user goal
- Start with happy path, then add complexity
- Include error and edge case paths
- Keep flows readable (not too many branches on one diagram)
- Use consistent notation
- Label every arrow with the trigger/action"
      ;;
    wireframe-spec)
      desc="Specify wireframe layouts with content priority, component placement, and annotation."
      body="# Wireframe Spec
You are an expert in creating annotated wireframe specifications.
## What You Do
You specify wireframe layouts defining content priority, component placement, behavior annotations, and responsive considerations.
## Wireframe Components
### Content Blocks
- Headers and navigation
- Hero/feature areas
- Content sections (text, media, cards)
- Forms and input areas
- Footers and secondary navigation
### Annotations
- Content priority numbers (what loads/appears first)
- Interaction notes (what happens on click/hover)
- Dynamic content indicators (personalized, data-driven)
- Responsive behavior notes
- Accessibility notes
### Content Specifications
- Heading hierarchy (H1, H2, H3)
- Approximate text length/character counts
- Image aspect ratios and sizing
- Required vs optional content
- Content source (static, CMS, API)
## Fidelity Levels
- **Sketch**: Hand-drawn boxes and labels
- **Low-fi**: Gray boxes with content labels
- **Mid-fi**: Realistic layout with placeholder content
- **Annotated**: Mid-fi plus detailed behavior specs
## Wireframe Conventions
- Use gray/black/white only (no color decisions)
- X-box for images
- Wavy lines for text blocks
- Real labels for navigation and buttons
- Consistent component representation
## Best Practices
- Focus on content hierarchy, not visual design
- Annotate behavior, not just layout
- Show multiple states (empty, loading, populated, error)
- Include responsive breakpoint versions
- Get content strategy input early"
      ;;
    click-test-plan)
      desc="Design click/first-click tests to evaluate navigation and information findability."
      body="# Click Test Plan
You are an expert in designing click tests that evaluate findability and navigation clarity.
## What You Do
You design first-click and click tests that measure whether users can find information and features.
## Test Types
- **First-click test**: Where do users click first for a given task?
- **Click-path test**: Full sequence of clicks to complete a task
- **Navigation test**: Can users find items using the nav structure?
- **Five-second test**: What do users remember after 5 seconds?
## Test Plan Structure
### 1. Objective
What navigation or findability question are you answering?
### 2. Stimuli
Screen designs or prototypes to test. Identify which pages/states to show.
### 3. Tasks
Clear, goal-oriented tasks without UI hints. Example: 'Where would you click to change your email address?'
### 4. Success Criteria
- Correct first click (target area defined)
- Time to first click
- Confidence rating
- Click distribution heat map
### 5. Participants
Number needed (typically 20-50 for quantitative), recruitment criteria, any segmentation.
## Analysis
- First-click success rate (above 65% generally indicates good findability)
- Click distribution patterns
- Time analysis (hesitation indicates confusion)
- Confidence correlation with accuracy
## Best Practices
- Test one task per screen
- Define click target areas before testing
- Use realistic content, not lorem ipsum
- Don't give hints in task wording
- Compare alternative designs with same tasks"
      ;;
    accessibility-test-plan)
      desc="Create accessibility testing plans covering assistive technologies and WCAG criteria."
      body="# Accessibility Test Plan
You are an expert in planning comprehensive accessibility testing.
## What You Do
You create testing plans that systematically evaluate accessibility across assistive technologies and WCAG criteria.
## Testing Layers
### 1. Automated Testing
- Axe, Lighthouse, WAVE tools
- Catches approximately 30-40% of issues
- Run on every page/state
- Integrate into CI/CD pipeline
### 2. Manual Testing
- Keyboard-only navigation
- Screen reader walkthrough
- Zoom to 200% and 400%
- High contrast mode
- Reduced motion mode
### 3. Assistive Technology Testing
- Screen readers: VoiceOver (Mac/iOS), NVDA (Windows), TalkBack (Android)
- Voice control: Voice Control (Mac/iOS), Dragon
- Switch control
- Screen magnification
### 4. User Testing with Disabilities
- Recruit participants with relevant disabilities
- Include variety (vision, motor, cognitive, hearing)
- Test with their own devices and settings
- Focus on real tasks, not compliance checkboxes
## Test Matrix
For each key user flow, test across: keyboard only, VoiceOver, NVDA, zoom 200%, high contrast, reduced motion.
## WCAG Criteria Checklist
Organize by principle (Perceivable, Operable, Understandable, Robust) and level (A, AA, AAA).
## Reporting
For each issue: description, WCAG criterion, severity, assistive tech affected, steps to reproduce, remediation.
## Best Practices
- Test early and continuously, not just before launch
- Automated testing is necessary but not sufficient
- Test with real assistive technology users
- Include accessibility in definition of done
- Prioritize by user impact, not just compliance level"
      ;;
  esac
  cat > "prototyping-testing/skills/$skill/SKILL.md" << ENDFILE
---
name: $skill
description: $desc
---
$body
ENDFILE
done
# Commands
cat > prototyping-testing/commands/prototype-plan.md << 'EOF'
---
description: Create a prototyping and testing plan for a design initiative.
argument-hint: "[feature or initiative to prototype and test]"
---
# /prototype-plan
Create a prototyping and testing plan.
## Steps
1. **Strategy** — Choose fidelity and method using `prototype-strategy` skill.
2. **Flows** — Map user flows to prototype using `user-flow-diagram` skill.
3. **Wireframes** — Specify wireframe layouts using `wireframe-spec` skill.
4. **Test scenarios** — Write usability tasks using `test-scenario` skill.
5. **Accessibility** — Plan accessibility testing using `accessibility-test-plan` skill.
6. **Timeline** — Create a prototyping and testing schedule.
## Output
Prototyping plan with fidelity rationale, user flows, wireframe specs, test scenarios, accessibility plan, and timeline.
Consider following up with `/test-plan` for detailed usability testing or `/evaluate` for expert review.
EOF
cat > prototyping-testing/commands/evaluate.md << 'EOF'
---
description: Run a heuristic evaluation of an existing design.
argument-hint: "[design, screen, or flow to evaluate]"
---
# /evaluate
Run a heuristic evaluation of a design.
## Steps
1. **Scope** — Define screens and flows to evaluate.
2. **Heuristic review** — Evaluate against Nielsen's heuristics using `heuristic-evaluation` skill.
3. **Flow analysis** — Review user flows for issues using `user-flow-diagram` skill.
4. **Accessibility check** — Evaluate accessibility using `accessibility-test-plan` skill.
5. **Severity rating** — Rate and prioritize all findings.
6. **Recommendations** — Provide specific improvement suggestions.
## Output
Evaluation report with findings per heuristic, severity ratings, accessibility issues, and prioritized recommendations.
Consider following up with `/test-plan` to validate findings with real users.
EOF
cat > prototyping-testing/commands/test-plan.md << 'EOF'
---
description: Design a complete usability testing plan.
argument-hint: "[product, feature, or prototype to test]"
---
# /test-plan
Design a complete usability testing plan.
## Steps
1. **Objectives** — Define what you need to learn.
2. **Method** — Choose testing approach using `prototype-strategy` skill.
3. **Scenarios** — Write test tasks using `test-scenario` skill.
4. **Click tests** — Design findability tests using `click-test-plan` skill.
5. **Accessibility** — Include accessibility testing using `accessibility-test-plan` skill.
6. **Logistics** — Define participants, schedule, equipment, and facilitation guide.
## Output
Testing plan with objectives, methodology, task scenarios, participant criteria, facilitation guide, and analysis framework.
Consider following up with `/evaluate` for expert review before user testing.
EOF
cat > prototyping-testing/commands/experiment.md << 'EOF'
---
description: Design an A/B experiment for a design hypothesis.
argument-hint: "[hypothesis or design change to test, e.g., 'new checkout flow will increase conversion']"
---
# /experiment
Design an A/B experiment.
## Steps
1. **Hypothesis** — Structure the hypothesis using `a-b-test-design` skill.
2. **Variants** — Define control and treatment designs.
3. **Metrics** — Define primary and guardrail metrics using `a-b-test-design` skill.
4. **Sample size** — Calculate required sample and duration using `a-b-test-design` skill.
5. **User flows** — Map variant flows using `user-flow-diagram` skill.
6. **Analysis plan** — Define how results will be analyzed and decisions made.
## Output
Experiment design document with hypothesis, variant specs, metrics, sample calculations, duration, and analysis plan.
Consider following up with `/test-plan` for qualitative testing alongside the experiment.
EOF
echo "✅ prototyping-testing complete (8 skills, 4 commands)"
