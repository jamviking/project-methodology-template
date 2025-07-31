# GitHub Repository Setup Guide

## Connecting Local Template to GitHub Repository

### Step 1: Navigate to Your Template Folder
```bash
# First, create the template if you haven't already
cd /home/kim/Developer/ccr-code-Projects/erp
./scripts/extract-template.sh project-methodology-template

# Navigate to the template folder
cd ../project-methodology-template
```

### Step 2: Connect to GitHub Repository
```bash
# Add the GitHub repository as remote origin
# Replace YOUR_USERNAME and YOUR_REPO_NAME with actual values
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git

# Verify the remote was added correctly
git remote -v
```

### Step 3: Push to GitHub
```bash
# Push your main branch to GitHub
git push -u origin main

# The -u flag sets upstream tracking so future pushes can just use 'git push'
```

## Complete Example Commands

Assuming your GitHub repository is at `https://github.com/yourusername/project-methodology-template`:

```bash
# Navigate to template folder
cd /home/kim/Developer/ccr-code-Projects/project-methodology-template

# Add GitHub remote
git remote add origin https://github.com/yourusername/project-methodology-template.git

# Push to GitHub
git push -u origin main
```

## If You Get Authentication Errors

### Option 1: Use Personal Access Token (Recommended)
```bash
# GitHub will prompt for username and password
# Use your GitHub username
# For password, use a Personal Access Token (not your GitHub password)

# To create a Personal Access Token:
# 1. Go to GitHub.com → Settings → Developer settings → Personal access tokens
# 2. Generate new token (classic)
# 3. Select scopes: repo, workflow
# 4. Copy the token and use it as password
```

### Option 2: Use SSH (Alternative)
```bash
# If you prefer SSH, change the remote URL
git remote set-url origin git@github.com:yourusername/project-methodology-template.git

# Then push
git push -u origin main
```

## Making Repository a Template

After pushing, enable template features:

### Via GitHub Web Interface:
1. Go to your repository on GitHub
2. Click **Settings** tab
3. Scroll down to **Template repository** section  
4. Check ✅ **Template repository**
5. Save changes

### Repository Description (Recommended):
Add this description in repository settings:
```
Complete development methodology template implementing systematic Document → Analyze → Refine → Approve philosophy for all levels of development
```

### Topics (Recommended):
Add these topics to help others find the template:
- `project-management`
- `development-methodology`
- `quality-assurance`
- `documentation`
- `agile`
- `project-template`

## Verification Steps

### 1. Check Repository Contents
Visit your GitHub repository and verify you see:
- ✅ README.md with usage instructions
- ✅ scripts/init-project-guides.sh
- ✅ docs/PROJECT-GUIDES/ folder with all methodology files
- ✅ Template repository badge/indicator

### 2. Test Template Usage
```bash
# Test creating a new project from your template
cd /tmp
git clone https://github.com/yourusername/project-methodology-template.git test-project
cd test-project
./scripts/init-project-guides.sh "Test Project"

# Verify it created all the expected files and folders
ls -la docs/PROJECT-GUIDES/
```

## Troubleshooting Common Issues

### Issue: "fatal: remote origin already exists"
```bash
# Remove existing remote and add the correct one
git remote remove origin
git remote add origin https://github.com/yourusername/project-methodology-template.git
```

### Issue: Authentication Failed
```bash
# Make sure you're using Personal Access Token as password
# Or configure Git with your credentials
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Issue: Repository Not Empty Error
```bash
# If GitHub repository has initial files (like README), pull first
git pull origin main --allow-unrelated-histories

# Then push
git push -u origin main
```

### Issue: Branch Name Mismatch
```bash
# If your local branch is 'master' but GitHub expects 'main'
git branch -M main
git push -u origin main
```

## Next Steps After Setup

### 1. Update Repository Settings
- Enable template repository feature
- Add description and topics
- Set up branch protection rules if needed

### 2. Create Release (Optional)
```bash
# Tag your initial version
git tag -a v1.0.0 -m "Initial project methodology template release"
git push origin v1.0.0
```

### 3. Share Template
Once set up as template repository, others can:
- Click "Use this template" button on GitHub
- Create new repositories with methodology pre-installed
- Get instant access to complete development framework

## Template Repository URL Structure
Your final template will be accessible at:
```
https://github.com/yourusername/project-methodology-template
```

And users can create new projects by clicking "Use this template" or:
```bash
gh repo create my-new-project --template yourusername/project-methodology-template
```