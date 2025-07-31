#!/bin/bash

# Universal Project Guides Initialization Script
# Usage: ./scripts/init-project-guides.sh [project-name] [target-path]

set -e

# Configuration
PROJECT_NAME=${1:-"New Project"}
TARGET_PATH=${2:-"."}
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$(dirname "$SCRIPT_DIR")"

echo "🚀 Initializing Project Guides for: $PROJECT_NAME"
echo "📁 Target directory: $TARGET_PATH"

# Create directory structure
echo "📁 Creating directory structure..."
mkdir -p "$TARGET_PATH/docs/PROJECT-GUIDES"
mkdir -p "$TARGET_PATH/docs/standards"
mkdir -p "$TARGET_PATH/docs/analysis"
mkdir -p "$TARGET_PATH/docs/epics"
mkdir -p "$TARGET_PATH/docs/sprints"
mkdir -p "$TARGET_PATH/.claude"

# Copy core methodology files
echo "📋 Copying core methodology files..."
cp "$TEMPLATE_DIR/docs/PROJECT-GUIDES/"*.md "$TARGET_PATH/docs/PROJECT-GUIDES/"
cp "$TEMPLATE_DIR/docs/standards/"*.md "$TARGET_PATH/docs/standards/"

# Replace placeholders with actual project name
echo "🔧 Customizing for $PROJECT_NAME..."
find "$TARGET_PATH/docs" -name "*.md" -exec sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" {} \;

# Create initial project context file
echo "📄 Creating initial project context..."
cat > "$TARGET_PATH/.claude/PROJECT-CONTEXT.md" << CONTEXT_EOF
# Project Context: $PROJECT_NAME

## 1. Project Vision
[To be documented - high-level project objectives and vision]

## 2. Current Status & Next Steps
- **Current Phase**: Project Initialization - IN PROGRESS
- **Next Step**: Complete high-level project documentation following Document → Analyze → Refine → Approve methodology

## 3. Key Architectural Decisions
[ADRs will be listed here as they are created]

## 4. Development Methodology
This project follows the systematic **Document → Analyze → Refine → Approve** methodology documented in:
- [Development Philosophy](../docs/PROJECT-GUIDES/development-philosophy.md)
- [Quality Gates Framework](../docs/PROJECT-GUIDES/quality-gates-framework.md)
- [Complete Project Guides](../docs/PROJECT-GUIDES/README.md)

## 5. Key Document Index
- [Project Guides Hub](../docs/PROJECT-GUIDES/README.md)
- [ADR Registry](../docs/PROJECT-GUIDES/adr-registry.md)
- [Story Creation Guide](../docs/PROJECT-GUIDES/story-creation-guide.md)
CONTEXT_EOF

# Create initial project brief template
echo "📋 Creating project brief template..."
cat > "$TARGET_PATH/docs/PROJECT-BRIEF.md" << BRIEF_EOF
# $PROJECT_NAME Hub

## 1. Project Vision
[Document high-level project objectives, scope, and success criteria]

## 2. Core Project Standards
Development methodology and quality assurance framework:

### Architectural Decision Records (ADRs)
Key architectural decisions that shape the project:
- **[ADR Registry](./PROJECT-GUIDES/adr-registry.md)**: Complete index of all architectural decisions
- **[ADR Process Guide](./PROJECT-GUIDES/adr-process-guide.md)**: How architectural decisions are made and documented

### Development Process Framework
Complete development methodology and quality improvement system:
- **[PROJECT GUIDES](./PROJECT-GUIDES/README.md)**: Complete development methodology implementing systematic **Document → Analyze → Refine → Approve** philosophy for all levels of development

---

## 3. Implementation Roadmap
[Document project phases, epics, and major milestones]

### Phase 0: Foundation
[Core infrastructure and foundational components]

### Phase 1: [Major Feature Set]
[Primary project deliverables]

---

## 4. Getting Started
New team members should:
1. Read [Development Philosophy](./PROJECT-GUIDES/development-philosophy.md)
2. Review [ADR Registry](./PROJECT-GUIDES/adr-registry.md)
3. Study [Story Creation Guide](./PROJECT-GUIDES/story-creation-guide.md)
4. Understand [Quality Gates Framework](./PROJECT-GUIDES/quality-gates-framework.md)
BRIEF_EOF

# Create initial gap analysis template
echo "📊 Creating gap analysis template..."
cat > "$TARGET_PATH/docs/analysis/project-gap-analysis.md" << GAP_EOF
# Project Gap Analysis: $PROJECT_NAME Initialization

## Analysis Date
$(date +"%Y-%m-%d")

## Analysis Scope
Initial project setup and methodology implementation

## Gap Analysis Framework

### 1. Documentation Gaps
- [ ] Project vision and objectives documented
- [ ] Success criteria clearly defined
- [ ] Scope boundaries established
- [ ] Stakeholder requirements gathered

### 2. Technical Gaps
- [ ] Technology stack decisions made
- [ ] Architecture approach defined
- [ ] Development environment setup
- [ ] Testing strategy established

### 3. Process Gaps
- [ ] Development methodology adopted
- [ ] Quality gates implemented
- [ ] Review and approval processes defined
- [ ] Team training completed

### 4. Resource Gaps
- [ ] Team composition finalized
- [ ] Skills assessment completed
- [ ] Timeline and budget confirmed
- [ ] External dependencies identified

## Priority Improvements
1. [High Priority Gap]
2. [Medium Priority Gap]
3. [Low Priority Gap]

## Next Steps
- [ ] Address high priority gaps
- [ ] Document first ADR (technology stack)
- [ ] Create first epic breakdown
- [ ] Establish regular review cycles

## Approval Required
This gap analysis requires review and approval before proceeding with project execution based on our Document → Analyze → Refine → Approve methodology.
GAP_EOF

# Create CLAUDE.md file with project guidance
echo "🤖 Creating CLAUDE.md guidance..."
cat > "$TARGET_PATH/CLAUDE.md" << CLAUDE_EOF
## Project Development Methodology

This project follows a systematic **Document → Analyze → Refine → Approve** methodology for all development activities.

### Core Requirements
1. **Load Context on Startup**: Read .claude/PROJECT-CONTEXT.md at the beginning of every session
2. **Follow Quality Gates**: Apply Document → Analyze → Refine → Approve at every level (Project → PRD → Epic → Sprint → Story)
3. **Seek Approval**: Require explicit approval at each development hierarchy level before proceeding
4. **Update Context**: Maintain .claude/PROJECT-CONTEXT.md with current project status and decisions

### Development Hierarchy Process
- **Project Level**: Document objectives → Analyze feasibility → Refine scope → Approve vision
- **PRD Level**: Document requirements → Analyze gaps → Refine specifications → Approve architecture  
- **Epic Level**: Document features → Analyze dependencies → Refine stories → Approve breakdown
- **Sprint Level**: Document commitment → Analyze capacity → Refine allocation → Approve execution
- **Story Level**: Document requirements → Analyze implementation → Refine approach → Approve development

### Key Resources
- Complete methodology: [docs/PROJECT-GUIDES/README.md](./docs/PROJECT-GUIDES/README.md)
- Development philosophy: [docs/PROJECT-GUIDES/development-philosophy.md](./docs/PROJECT-GUIDES/development-philosophy.md)
- Quality gates: [docs/PROJECT-GUIDES/quality-gates-framework.md](./docs/PROJECT-GUIDES/quality-gates-framework.md)
- ADR process: [docs/PROJECT-GUIDES/adr-process-guide.md](./docs/PROJECT-GUIDES/adr-process-guide.md)
- Story creation: [docs/PROJECT-GUIDES/story-creation-guide.md](./docs/PROJECT-GUIDES/story-creation-guide.md)

### Important Reminders
- Always work collaboratively with user approval authority for final decisions
- Document architectural decisions as ADRs with proper process
- Create high-quality stories with dependency and resource tracking
- Apply systematic gap analysis at every development level
- Maintain living documentation that can be revised as needed
CLAUDE_EOF

echo "✅ Project Guides initialization complete!"
echo ""
echo "📋 Next Steps:"
echo "1. Review and customize docs/PROJECT-BRIEF.md"
echo "2. Complete docs/analysis/project-gap-analysis.md"
echo "3. Follow Document → Analyze → Refine → Approve process"
echo "4. Create first ADR for major technology decisions"
echo ""
echo "📚 Quick Start: Review docs/PROJECT-GUIDES/README.md"
echo "🤖 AI Assistant: CLAUDE.md created with project methodology guidance"
