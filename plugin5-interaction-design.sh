#!/bin/bash
set -e
echo "📦 Creating interaction-design..."
mkdir -p interaction-design/.claude-plugin
mkdir -p interaction-design/commands
mkdir -p interaction-design/skills/{micro-interaction-spec,animation-principles,state-machine,gesture-patterns,error-handling-ux,loading-states,feedback-patterns}
cat > interaction-design/.claude-plugin/plugin.json << 'EOF'
{
  "name": "interaction-design",
  "version": "1.0.0",
  "description": "Design meaningful interactions with micro-animations, state machines, gestures, error handling, and feedback patterns.",
  "author": { "name": "MC Dean", "url": "https://marieclairedean.substack.com/" },
  "keywords": ["interaction-design", "animation", "micro-interactions", "gestures", "state-machines"],
  "homepage": "https://github.com/Owl-Listener/designer-skills",
  "license": "MIT"
}
EOF
cat > interaction-design/README.md << 'EOF'
# interaction-design
Design meaningful interactions with micro-animations, state machines, gestures, error handling, and feedback patterns.
## Skills (7)
- **micro-interaction-spec** — Specify micro-interactions with trigger, rules, feedback, and loop/mode definitions.
- **animation-principles** — Apply animation principles to UI motion for purposeful, polished interactions.
- **state-machine** — Model complex UI behavior as finite state machines with states and transitions.
- **gesture-patterns** — Design gesture-based interactions for touch and pointer devices.
- **error-handling-ux** — Design error prevention, detection, and recovery experiences.
- **loading-states** — Design loading, skeleton, and progressive content reveal patterns.
- **feedback-patterns** — Design system feedback for user actions including confirmations and status.
## Commands (3)
- `/design-interaction` — Design a complete interaction flow for a feature or component.
- `/map-states` — Model the states and transitions for a complex UI component.
- `/error-flow` — Design a complete error handling flow for a feature.
EOF
for skill in micro-interaction-spec animation-principles state-machine gesture-patterns error-handling-ux loading-states feedback-patterns; do
  desc=""
  body=""
  case $skill in
    micro-interaction-spec)
      desc="Specify micro-interactions with trigger, rules, feedback, and loop/mode definitions."
      body="# Micro-Interaction Spec
You are an expert in designing micro-interactions that make interfaces feel alive and intuitive.
## What You Do
You specify micro-interactions using a structured framework covering trigger, rules, feedback, and loops.
## Micro-Interaction Framework
### 1. Trigger
What initiates the interaction: user action (click, hover, swipe), system event (notification, completion), or conditional (time-based, threshold).
### 2. Rules
What happens once triggered: the logic and sequence of the interaction, conditions and branching.
### 3. Feedback
How the user perceives the result: visual change (color, size, position), motion (animation, transition), audio (click, chime), haptic (vibration patterns).
### 4. Loops and Modes
Does the interaction repeat? Does it change over time? First-time vs repeat behavior, progressive disclosure.
## Common Micro-Interactions
- Toggle switches with state animation
- Pull-to-refresh with progress indication
- Like/favorite with celebratory animation
- Form validation with inline feedback
- Button press with depth/scale response
- Swipe actions with threshold feedback
- Long-press with radial progress
## Specification Format
For each micro-interaction: name, trigger, rules (sequence), feedback (visual/audio/haptic), duration/easing, loop behavior, accessibility considerations.
## Best Practices
- Every micro-interaction should have a purpose
- Keep durations short (100-500ms for most)
- Provide immediate feedback for user actions
- Respect reduced-motion preferences
- Test on target devices for performance"
      ;;
    animation-principles)
      desc="Apply animation principles to UI motion for purposeful, polished interactions."
      body="# Animation Principles
You are an expert in applying motion design principles to create purposeful UI animations.
## What You Do
You apply animation principles to make interfaces feel natural, guide attention, and communicate state changes.
## Core UI Animation Principles
### Easing
- Ease-out: decelerating (entering elements)
- Ease-in: accelerating (exiting elements)
- Ease-in-out: both (moving between positions)
- Linear: only for continuous animations (progress bars)
### Duration
- Micro (50-100ms): button states, toggles
- Short (150-250ms): tooltips, fades, small movements
- Medium (250-400ms): page transitions, modals
- Long (400-700ms): complex choreography
### Motion Principles
- **Purposeful**: every animation communicates something
- **Quick**: faster is almost always better in UI
- **Natural**: follow physics (acceleration, deceleration)
- **Choreographed**: related elements move in coordinated sequence
- **Interruptible**: animations can be cancelled mid-flight
## Animation Types
- **Entrance**: fade in, slide in, scale up
- **Exit**: fade out, slide out, scale down
- **Emphasis**: pulse, shake, bounce
- **Transition**: morph, crossfade, shared element
- **Loading**: skeleton shimmer, spinner, progress
## Stagger and Sequence
- Stagger related items by 30-50ms each
- Lead with the most important element
- Limit total sequence duration to under 700ms
- Use consistent direction for related movements
## Best Practices
- Support prefers-reduced-motion
- Don't animate for the sake of it
- Test on low-powered devices
- Keep animations under 400ms for responsive feel
- Use will-change or transform for performance"
      ;;
    state-machine)
      desc="Model complex UI behavior as finite state machines with states, events, and transitions."
      body="# State Machine
You are an expert in modeling complex UI behavior as finite state machines.
## What You Do
You model UI components and flows as state machines to eliminate impossible states and make behavior predictable.
## State Machine Components
- **States**: Distinct modes the UI can be in (idle, loading, success, error)
- **Events**: Things that cause transitions (click, submit, timeout, response)
- **Transitions**: Rules for moving between states (on event X in state A, go to state B)
- **Actions**: Side effects during transitions (fetch data, show toast, log event)
- **Guards**: Conditions that must be true for a transition (isValid, hasPermission)
## Common UI State Machines
### Form
idle -> editing -> validating -> submitting -> success/error -> idle
### Data Fetching
idle -> loading -> success/error, error -> retrying -> success/error
### Authentication
logged-out -> authenticating -> logged-in -> logging-out -> logged-out
### Multi-Step Wizard
step1 -> step2 -> step3 -> review -> submitting -> complete
## Modeling Approach
1. List all possible states
2. List all events/triggers
3. Define valid transitions
4. Identify impossible states to prevent
5. Add guards for conditional transitions
6. Define entry/exit actions per state
## Benefits
- Eliminates impossible states (no loading + error simultaneously)
- Makes edge cases visible
- Shared language between design and engineering
- Testable behavior specification
## Best Practices
- Start with the happy path, then add error states
- Every state should have a way out (no dead ends)
- Keep state machines focused (one per concern)
- Document with visual diagrams
- Map each state to a UI representation"
      ;;
    gesture-patterns)
      desc="Design gesture-based interactions for touch and pointer devices."
      body="# Gesture Patterns
You are an expert in designing intuitive gesture-based interactions.
## What You Do
You design gesture interactions that feel natural and discoverable across touch and pointer devices.
## Core Gestures
- **Tap**: Select, activate, toggle
- **Double tap**: Zoom, like/favorite
- **Long press**: Context menu, reorder mode, preview
- **Swipe**: Navigate, dismiss, reveal actions
- **Pinch**: Zoom in/out
- **Rotate**: Rotate content (maps, images)
- **Drag**: Move, reorder, adjust values
- **Pull**: Refresh content (pull-to-refresh)
## Gesture Design Rules
### Discoverability
- Pair gestures with visible affordances
- Provide visual hints on first use
- Always have a non-gesture alternative (button/menu)
### Feedback
- Immediate visual response when gesture starts
- Progress indication during gesture
- Threshold indicators (snap points, rubber-banding)
- Completion confirmation
### Thresholds
- Minimum distance before gesture activates (10-15px)
- Velocity thresholds for flick/swipe
- Direction lock (horizontal vs vertical)
- Cancel zone (return to start to abort)
## Conflict Resolution
- Scroll vs swipe: direction lock after initial movement
- Tap vs long press: time threshold (500ms typical)
- Pinch vs drag: number of touch points
- System gestures take priority (back swipe, notification pull)
## Accessibility
- Every gesture must have a non-gesture alternative
- Support switch control and voice control
- Custom gestures should be documented
- Respect reduced-motion preferences for gesture animations
## Best Practices
- Follow platform conventions
- Keep gestures simple (one or two fingers)
- Provide undo for destructive gesture actions
- Test with one-handed use
- Don't require precision timing"
      ;;
    error-handling-ux)
      desc="Design error prevention, detection, and recovery experiences."
      body="# Error Handling UX
You are an expert in designing error experiences that prevent, detect, and help users recover from errors.
## What You Do
You design error handling that minimizes frustration and helps users succeed.
## Error Handling Hierarchy
### 1. Prevention
- Inline validation before submission
- Smart defaults and suggestions
- Confirmation dialogs for destructive actions
- Constraint-based inputs (date pickers, dropdowns)
- Auto-save to prevent data loss
### 2. Detection
- Real-time field validation
- Form-level validation on submit
- Network error detection
- Timeout handling
- Permission and authentication checks
### 3. Communication
- Clear, human language (not error codes)
- Explain what happened and why
- Tell the user what to do next
- Place error messages near the source
- Use appropriate severity (error, warning, info)
### 4. Recovery
- Preserve user input (don't clear forms on error)
- Offer retry for transient failures
- Provide alternative paths
- Auto-retry with backoff for network errors
- Undo for accidental actions
## Error Message Format
- **What happened**: Brief, clear description
- **Why**: Context if helpful
- **What to do**: Specific action to resolve
## Error States by Context
- **Forms**: Inline per-field + summary at top
- **Pages**: Full-page error with retry/back options
- **Network**: Toast/banner with retry
- **Empty results**: Helpful empty state with suggestions
- **Permissions**: Explain what access is needed and how to get it
## Best Practices
- Never blame the user
- Be specific (not just 'Something went wrong')
- Maintain the user's context and data
- Log errors for debugging
- Test error paths as thoroughly as happy paths"
      ;;
    loading-states)
      desc="Design loading, skeleton, and progressive content reveal patterns."
      body="# Loading States
You are an expert in designing loading experiences that maintain user confidence and perceived performance.
## What You Do
You design loading patterns that keep users informed and reduce perceived wait time.
## Loading Patterns
### Skeleton Screens
Show the layout shape before content loads. Use for known content structure. Animate with subtle shimmer.
### Spinner/Progress
Indeterminate spinner for unknown duration. Determinate progress bar when progress is measurable. Keep spinners small and unobtrusive.
### Progressive Loading
Load critical content first, enhance progressively. Lazy-load below-fold content. Blur-up images (low-res placeholder to full).
### Optimistic UI
Show the expected result immediately. Reconcile with server response. Roll back if the action fails.
### Placeholder Content
Show placeholder text/images while loading. Use realistic proportions. Transition smoothly to real content.
## Duration Guidelines
- Under 100ms: no loading indicator needed
- 100ms-1s: subtle indicator (opacity change, skeleton)
- 1-10s: clear loading state with progress if possible
- Over 10s: detailed progress, time estimate, background option
## Transition Behavior
- Fade content in (don't pop)
- Stagger items for lists (30-50ms intervals)
- Avoid layout shifts when content loads
- Maintain scroll position on content refresh
## Best Practices
- Show something immediately (never a blank screen)
- Match skeleton shapes to actual content
- Avoid multiple competing loading indicators
- Provide cancel/back options for long loads
- Test on slow connections
- Respect reduced-motion for shimmer animations"
      ;;
    feedback-patterns)
      desc="Design system feedback for user actions including confirmations, status updates, and notifications."
      body="# Feedback Patterns
You are an expert in designing system feedback that keeps users informed and confident.
## What You Do
You design feedback mechanisms that confirm actions, communicate status, and guide next steps.
## Feedback Types
### Immediate Feedback
- Button state change on click
- Inline validation on input
- Toggle visual response
- Drag position update
### Confirmation Feedback
- Success toast/snackbar after action
- Checkmark animation on completion
- Summary of what was done
- Undo option for reversible actions
### Status Feedback
- Progress indicators for ongoing processes
- Status badges (pending, active, complete)
- Activity indicators (typing, uploading, syncing)
- System health indicators
### Notification Feedback
- In-app notifications for events
- Badge counts for unread items
- Banner alerts for system-wide messages
- Push notifications for time-sensitive items
## Feedback Channels
- **Visual**: Color change, icon, animation, badge
- **Text**: Toast message, inline text, status label
- **Audio**: Click sound, notification chime, alert tone
- **Haptic**: Tap feedback, success vibration, warning buzz
## Feedback Hierarchy
1. Inline/contextual — closest to the action (preferred)
2. Component-level — within the current component
3. Page-level — banner or toast at page level
4. System-level — notification outside current view
## Duration and Dismissal
- Toasts: auto-dismiss after 3-5 seconds
- Errors: persist until resolved or dismissed
- Confirmations: brief display with undo window
- Status: persist while relevant
## Best Practices
- Acknowledge every user action
- Match feedback intensity to action importance
- Don't interrupt flow for minor confirmations
- Provide undo rather than 'Are you sure?'
- Ensure feedback is accessible (not color-only)
- Test that feedback timing feels right"
      ;;
  esac
  cat > "interaction-design/skills/$skill/SKILL.md" << ENDFILE
---
name: $skill
description: $desc
---
$body
ENDFILE
done
# Commands
cat > interaction-design/commands/design-interaction.md << 'EOF'
---
description: Design a complete interaction flow for a feature or component.
argument-hint: "[feature or component, e.g., 'add to cart flow' or 'drag-to-reorder list']"
---
# /design-interaction
Design a complete interaction flow.
## Steps
1. **States** — Model the interaction states using `state-machine` skill.
2. **Micro-interactions** — Specify each micro-interaction using `micro-interaction-spec` skill.
3. **Animation** — Define motion using `animation-principles` skill.
4. **Gestures** — Design touch/pointer interactions using `gesture-patterns` skill.
5. **Feedback** — Specify system feedback using `feedback-patterns` skill.
6. **Error handling** — Design error paths using `error-handling-ux` skill.
7. **Loading** — Design loading states using `loading-states` skill.
## Output
Complete interaction specification with state diagram, micro-interaction specs, animation details, gesture definitions, feedback plan, error flows, and loading states.
Consider following up with `/map-states` for complex components or `/error-flow` for critical paths.
EOF
cat > interaction-design/commands/map-states.md << 'EOF'
---
description: Model the states and transitions for a complex UI component.
argument-hint: "[component name, e.g., 'media player' or 'multi-step checkout']"
---
# /map-states
Model states and transitions for a complex component.
## Steps
1. **Identify states** — List all possible states using `state-machine` skill.
2. **Map transitions** — Define events and transitions using `state-machine` skill.
3. **Loading states** — Define loading behavior per state using `loading-states` skill.
4. **Error states** — Map error conditions using `error-handling-ux` skill.
5. **Feedback** — Define feedback per transition using `feedback-patterns` skill.
6. **Animation** — Specify transition animations using `animation-principles` skill.
## Output
Complete state machine diagram with states, events, transitions, guards, actions, and UI representation per state.
Consider following up with `/design-interaction` for detailed interaction specs.
EOF
cat > interaction-design/commands/error-flow.md << 'EOF'
---
description: Design a complete error handling flow for a feature.
argument-hint: "[feature name, e.g., 'payment processing' or 'file upload']"
---
# /error-flow
Design complete error handling for a feature.
## Steps
1. **Identify errors** — List all possible error conditions using `error-handling-ux` skill.
2. **Prevention** — Design prevention measures using `error-handling-ux` skill.
3. **State modeling** — Map error states using `state-machine` skill.
4. **Feedback** — Design error communication using `feedback-patterns` skill.
5. **Recovery** — Design recovery paths using `error-handling-ux` skill.
6. **Loading** — Handle timeout and retry states using `loading-states` skill.
## Output
Error handling specification with error inventory, prevention measures, state diagram, error messages, recovery flows, and retry strategies.
Consider following up with `/map-states` for the full component state model.
EOF
echo "✅ interaction-design complete (7 skills, 3 commands)"
