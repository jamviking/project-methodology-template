# Creating Standalone Project Guides Template

## Overview
This guide explains how to extract {{PROJECT_NAME}} guides system into a standalone, reusable template that can be deployed to any project without dependencies on the original {{PROJECT_NAME}}.

## Approaches for Independence

### Option 1: GitHub Template Repository (Recommended)
Create a dedicated GitHub template repository that can be used to bootstrap any new project.

### Option 2: NPM Package Distribution
Package the guides as an NPM package for easy installation and updates.

### Option 3: Standalone Archive Distribution
Create downloadable archives that can be extracted into any project.

---

## Option 1: GitHub Template Repository Setup

### Step 1: Create Template Repository Structure
```bash
# Create new repository
mkdir project-guides-template
cd project-guides-template

# Initialize git
git init
git branch -M main

# Create directory structure
mkdir -p docs/PROJECT-GUIDES
mkdir -p docs/standards
mkdir -p docs/analysis
mkdir -p docs/epics
mkdir -p docs/sprints
mkdir -p .claude
mkdir -p scripts
```

### Step 2: Copy Template Files
```bash
# Copy core methodology files (with placeholders)
cp /path/to/source/docs/PROJECT-GUIDES/*.md docs/PROJECT-GUIDES/
cp /path/to/source/docs/standards/adr-template.md docs/standards/
```

### Step 3: Create Templated Files
Replace project-specific references with placeholders like `{{PROJECT_NAME}}`, `{{PROJECT_DESCRIPTION}}`, etc.

### Step 4: Repository Configuration
Create `.github/template-settings.yml`:
```yaml
name: "Project Development Methodology Template"
description: "Bootstrap any project with systematic Document → Analyze → Refine → Approve methodology"
topics:
  - project-management
  - development-methodology
  - quality-assurance
  - documentation
  - agile
```

---

## Option 2: NPM Package Distribution

### Package Structure
```
project-guides-toolkit/
├── package.json
├── bin/
│   └── init-project-guides
├── templates/
│   ├── docs/
│   │   ├── PROJECT-GUIDES/
│   │   ├── standards/
│   │   └── analysis/
│   ├── .claude/
│   └── scripts/
└── lib/
    ├── setup.js
    └── templates.js
```

### Package.json Configuration
```json
{
  "name": "project-guides-toolkit",
  "version": "1.0.0",
  "description": "Development methodology toolkit with Document → Analyze → Refine → Approve framework",
  "bin": {
    "init-project-guides": "./bin/init-project-guides"
  },
  "keywords": [
    "project-management",
    "development-methodology",
    "quality-assurance",
    "agile",
    "documentation"
  ],
  "engines": {
    "node": ">=14.0.0"
  }
}
```

### CLI Tool Implementation
```javascript
#!/usr/bin/env node
const path = require('path');
const fs = require('fs-extra');
const { program } = require('commander');
const setup = require('../lib/setup');

program
  .version('1.0.0')
  .description('Initialize project with development methodology guides')
  .argument('<project-name>', 'Name of {{PROJECT_NAME}}')
  .option('-p, --path <path>', 'Target directory path', '.')
  .option('-t, --template <template>', 'Template type', 'standard')
  .action(async (projectName, options) => {
    await setup.initializeProject(projectName, options);
  });

program.parse();
```

---

## Option 3: Standalone Archive Distribution

### Create Distribution Script
```bash
#!/bin/bash
# create-distribution.sh

VERSION="1.0.0"
DIST_NAME="project-guides-v${VERSION}"

echo "Creating standalone project guides distribution..."

# Create distribution directory
mkdir -p dist/$DIST_NAME

# Copy core files
cp -r docs/PROJECT-GUIDES dist/$DIST_NAME/docs/
cp -r docs/standards dist/$DIST_NAME/docs/
mkdir -p dist/$DIST_NAME/docs/{analysis,epics,sprints}
mkdir -p dist/$DIST_NAME/.claude
mkdir -p dist/$DIST_NAME/scripts

# Create standalone initialization script
cat > dist/$DIST_NAME/init-project.sh << 'EOF'
#!/bin/bash
# Standalone Project Guides Initialization
# Usage: ./init-project.sh [project-name] [target-path]

PROJECT_NAME=${1:-"New Project"}
TARGET_PATH=${2:-"."}

echo "🚀 Initializing Project Guides for: $PROJECT_NAME"

# Copy methodology files
cp -r docs $TARGET_PATH/
cp -r .claude $TARGET_PATH/
cp -r scripts $TARGET_PATH/

# Customize files with project name
find $TARGET_PATH -name "*.md" -exec sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" {} \;

echo "✅ Project Guides initialized successfully!"
EOF

chmod +x dist/$DIST_NAME/init-project.sh

# Create archive
cd dist
tar -czf $DIST_NAME.tar.gz $DIST_NAME/
zip -r $DIST_NAME.zip $DIST_NAME/

echo "Distribution created: $DIST_NAME.tar.gz and $DIST_NAME.zip"
```

---

## Implementation: Recommended Approach

### Step-by-Step GitHub Template Creation

#### 1. Extract and Templatize Files
```bash
#!/bin/bash
# extract-template.sh

# Create clean template directory
mkdir -p project-methodology-template
cd project-methodology-template

# Copy and templatize files
cp -r ../docs/PROJECT-GUIDES docs/
cp -r ../docs/standards docs/
mkdir -p docs/{analysis,epics,sprints}
mkdir -p .claude scripts

# Replace project-specific content with placeholders
find docs -name "*.md" -exec sed -i 's/{{PROJECT_NAME}}/{{PROJECT_NAME}}/g' {} \;
find docs -name "*.md" -exec sed -i 's/{{PROJECT_NAME}}/{{PROJECT_NAME}}/g' {} \;
find docs -name "*.md" -exec sed -i 's/{{PROJECT_NAME}}/{{PROJECT_NAME}}/g' {} \;
```

#### 2. Create Universal Initialization Script
```bash
#!/bin/bash
# init-project-guides.sh (Universal Version)

set -e

# Configuration
PROJECT_NAME=${1:-"New Project"}
TARGET_PATH=${2:-"."}
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$SCRIPT_DIR"

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
cp -r "$TEMPLATE_DIR/docs/PROJECT-GUIDES/"* "$TARGET_PATH/docs/PROJECT-GUIDES/"
cp -r "$TEMPLATE_DIR/docs/standards/"* "$TARGET_PATH/docs/standards/"

# Replace placeholders with actual project name
echo "🔧 Customizing for $PROJECT_NAME..."
find "$TARGET_PATH/docs" -name "*.md" -exec sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" {} \;

# Create initial project files
echo "📄 Creating initial project context..."
cat > "$TARGET_PATH/.claude/PROJECT-CONTEXT.md" << EOF
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
EOF

# Create project brief
cat > "$TARGET_PATH/docs/PROJECT-BRIEF.md" << EOF
# $PROJECT_NAME Hub

## 1. Project Vision
[Document high-level project objectives, scope, and success criteria]

## 2. Core Project Standards
Development methodology and quality assurance framework:

### Architectural Decision Records (ADRs)
Key architectural decisions that shape {{PROJECT_NAME}}:
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
EOF

# Create CLAUDE.md
cat > "$TARGET_PATH/CLAUDE.md" << EOF
## Project Development Methodology

This project follows a systematic **Document → Analyze → Refine → Approve** methodology for all development activities.

### Core Requirements
1. **Load Context on Startup**: Read .claude/PROJECT-CONTEXT.md at the beginning of every session
2. **Follow Quality Gates**: Apply Document → Analyze → Refine → Approve at every level (Project → PRD → Epic → Sprint → Story)
3. **Seek Approval**: Require explicit approval at each development hierarchy level before proceeding
4. **Update Context**: Maintain .claude/PROJECT-CONTEXT.md with current project status and decisions

### Key Resources
- Complete methodology: [docs/PROJECT-GUIDES/README.md](./docs/PROJECT-GUIDES/README.md)
- Development philosophy: [docs/PROJECT-GUIDES/development-philosophy.md](./docs/PROJECT-GUIDES/development-philosophy.md)
- Quality gates: [docs/PROJECT-GUIDES/quality-gates-framework.md](./docs/PROJECT-GUIDES/quality-gates-framework.md)
EOF

echo "✅ Project Guides initialization complete!"
echo ""
echo "📋 Next Steps:"
echo "1. Review and customize docs/PROJECT-BRIEF.md"
echo "2. Follow Document → Analyze → Refine → Approve process"
echo "3. Create first ADR for major technology decisions"
echo ""
echo "📚 Quick Start: Review docs/PROJECT-GUIDES/README.md"
```

#### 3. Create Template Repository
```bash
# Initialize as template repository
git init
git add .
git commit -m "Initial project methodology template"

# Push to GitHub and mark as template
gh repo create project-methodology-template --template --public
git remote add origin https://github.com/yourusername/project-methodology-template.git
git push -u origin main
```

---

## Usage Examples

### Using GitHub Template
```bash
# Option 1: Use GitHub UI to create new repository from template

# Option 2: Use GitHub CLI
gh repo create my-new-project --template yourusername/project-methodology-template

# Option 3: Clone and initialize
git clone https://github.com/yourusername/project-methodology-template.git my-new-project
cd my-new-project
./init-project-guides.sh "My New Project"
```

### Using NPM Package
```bash
# Install globally
npm install -g project-guides-toolkit

# Initialize new project
init-project-guides "My New Project" --path ./my-project

# Or use npx for one-time use
npx project-guides-toolkit "My New Project"
```

### Using Standalone Archive
```bash
# Download and extract
wget https://releases.example.com/project-guides-v1.0.0.tar.gz
tar -xzf project-guides-v1.0.0.tar.gz

# Initialize project
cd project-guides-v1.0.0
./init-project.sh "My New Project" /path/to/target
```

---

## Benefits of Standalone Approach

### ✅ **Complete Independence**
- No dependencies on source {{PROJECT_NAME}}
- Self-contained methodology package
- Version-controlled template evolution

### ✅ **Easy Distribution**
- GitHub template for immediate use
- NPM package for developer workflows
- Archive downloads for offline use

### ✅ **Consistent Updates**
- Template repository can be updated with improvements
- NPM package versioning for controlled updates
- Clear migration paths for methodology evolution

### ✅ **Organizational Adoption**
- Fork template for organizational customization
- Private template repositories for company-specific adaptations
- Enterprise package distribution through private registries

The recommended approach is the **GitHub Template Repository** as it provides the best balance of accessibility, version control, and ease of use while maintaining complete independence from the source project.