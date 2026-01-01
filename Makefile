.PHONY: all menu run db watch clean lint verify fix check test build package purge prepare \
        status branch sync stage commit push pr amend undo backup restore \
        hooks release hotfix riverpod-debug help

# --- GREYWAY.CO PALETTE ---
RED=\033[0;31m
GREEN=\033[0;32m
YELLOW=\033[1;33m
BLUE=\033[0;34m
MAGENTA=\033[0;35m
CYAN=\033[0;36m
NC=\033[0m # No Color

PROJECT_NAME=clue_player
APPIMAGE_NAME=CluePlayer.AppImage
MAIN_BRANCH=main

# --- DEFAULT ACTION ---
all: menu

# --- INTERACTIVE MENU ---
menu:
	@mkdir -p scripts
	@chmod +x scripts/menu.sh 2>/dev/null || true
	@if [ -f scripts/menu.sh ]; then \
		./scripts/menu.sh; \
	else \
		echo "${RED}Menu script not found. Using help instead.${NC}"; \
		make help; \
	fi

# --- CORE DEVELOPMENT LOOP ---

run:
	@echo "${CYAN}► Launching Clue Player (Linux Debug)...${NC}"
	@flutter run -d linux --dart-define=ENV=development

# Database with smart error handling
db:
	@echo "${MAGENTA}► Rebuilding Database Schema...${NC}"
	@echo "${YELLOW}Cleaning old generated files...${NC}"
	@find lib -name "*.g.dart" -delete 2>/dev/null || true
	@echo "${YELLOW}Running build runner...${NC}"
	@if dart run build_runner build --delete-conflicting-outputs; then \
		echo "${GREEN}✓ Schema and DAOs synchronized${NC}"; \
	else \
		echo "${RED}✗ Build failed. Common issues:${NC}"; \
		echo "  • Missing imports (check flutter_riverpod)"; \
		echo "  • Circular dependencies in providers"; \
		echo "  • Riverpod v3 syntax (capital @Riverpod for factories)"; \
		echo ""; \
		echo "${YELLOW}Run 'make riverpod-debug' for detailed analysis${NC}"; \
		exit 1; \
	fi

watch:
	@echo "${YELLOW}► Watching for Schema Changes (Ctrl+C to stop)...${NC}"
	@echo "${BLUE}Auto-regeneration active. Edit and save to rebuild.${NC}"
	@dart run build_runner watch --delete-conflicting-outputs

clean:
	@echo "${RED}► Scrubbing Workspace...${NC}"
	@flutter clean
	@rm -rf .dart_tool build pubspec.lock .packages .pub-cache
	@find . -name "*.g.dart" -delete 2>/dev/null || true
	@find . -name "*.freezed.dart" -delete 2>/dev/null || true
	@echo "${GREEN}✓ Workspace reset. Run 'make prepare' to reinstall${NC}"

lint:
	@echo "${BLUE}► Running Static Analysis...${NC}"
	@dart analyze --fatal-infos
	@echo "${GREEN}✓ Code meets Greyway standards${NC}"

verify: check lint
	@echo "${GREEN}✓ System verified for development${NC}"

fix:
	@echo "${YELLOW}► Applying Greyway Corrections...${NC}"
	@dart fix --apply
	@dart format lib/ test/
	@echo "${GREEN}✓ Code standardized${NC}"

test:
	@echo "${YELLOW}► Running Tests...${NC}"
	@flutter test
	@echo "${GREEN}✓ Tests passed${NC}"

check:
	@echo "${BLUE}► Verifying System Dependencies...${NC}"
	@which ffmpeg > /dev/null && echo "${GREEN}✓ ffmpeg $(ffmpeg -version | head -n1 | cut -d' ' -f3)${NC}" || echo "${RED}✗ ffmpeg MISSING${NC}"
	@which yt-dlp > /dev/null && echo "${GREEN}✓ yt-dlp $(yt-dlp --version)${NC}" || echo "${RED}✗ yt-dlp MISSING${NC}"
	@which sqlite3 > /dev/null && echo "${GREEN}✓ sqlite3 $(sqlite3 --version | cut -d' ' -f1)${NC}" || echo "${YELLOW}⚠ sqlite3 optional${NC}"
	@echo "${BLUE}► Flutter Environment:${NC}"
	@flutter --version | grep -E "(Flutter|Engine|Dart)" | head -3

# --- RELEASE ENGINEERING ---

build:
	@echo "${YELLOW}► Compiling Production Binary...${NC}"
	@flutter build linux --release --dart-define=ENV=production
	@if [ -f build/linux/x64/release/bundle/${PROJECT_NAME} ]; then \
		cp build/linux/x64/release/bundle/${PROJECT_NAME} build/linux/x64/release/bundle/CluePlayer 2>/dev/null || true; \
		echo "${GREEN}✓ Binary ready: build/linux/x64/release/bundle/CluePlayer${NC}"; \
	else \
		echo "${GREEN}✓ Binary ready in build/ directory${NC}"; \
	fi

package: build
	@echo "${CYAN}► Packaging as AppImage...${NC}"
	@which appimagetool > /dev/null || (echo "${RED}✗ appimagetool not installed${NC}"; echo "Install: https://github.com/AppImage/AppImageKit"; exit 1)
	@cd build/linux/x64/release/bundle && \
		appimagetool . ${APPIMAGE_NAME} --no-appstream
	@mv build/linux/x64/release/bundle/${APPIMAGE_NAME} .
	@echo "${GREEN}✓ Distribution package: ${APPIMAGE_NAME}${NC}"
	@echo "${BLUE}Run: ./${APPIMAGE_NAME} to test${NC}"

purge:
	@echo "${RED}► Purging All Build Artifacts...${NC}"
	@rm -rf build/ coverage/ *.AppImage
	@echo "${GREEN}✓ All artifacts removed${NC}"

prepare:
	@echo "${CYAN}► Bootstraping Project...${NC}"
	@flutter pub get
	@make db
	@echo "${GREEN}✓ Project ready. Run 'make verify' to check system${NC}"

# --- DEBUG TOOLS ---

riverpod-debug:
	@echo "${RED}► DEBUG: Riverpod Generation Issues${NC}"
	@echo "${YELLOW}1. Checking riverpod version...${NC}"
	@dart pub deps | grep -A2 -B2 riverpod || echo "${RED}Riverpod not found in dependencies${NC}"
	@echo ""
	@echo "${YELLOW}2. Checking provider files...${NC}"
	@find lib -name "*provider*.dart" -exec echo "  {}" \;
	@echo ""
	@echo "${YELLOW}3. Clean rebuild...${NC}"
	@make clean
	@flutter pub get
	@echo "${YELLOW}4. Regenerating...${NC}"
	@dart run build_runner clean
	@dart run build_runner build --delete-conflicting-outputs

# --- ADVANCED GIT CONTROL SYSTEM ---

status:
	@echo "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	@echo "${GREEN}REPOSITORY STATUS${NC}"
	@echo "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	@git status --short --branch
	@echo ""
	@echo "${BLUE}Recent Commits:${NC}"
	@git log --oneline -5 --graph --decorate 2>/dev/null || echo "${YELLOW}No commits yet${NC}"

branch:
	@echo "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	@echo "${GREEN}BRANCH OVERVIEW${NC}"
	@echo "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	@git branch -avv
	@echo ""
	@echo "${BLUE}Current:${NC} $(shell git branch --show-current 2>/dev/null || echo 'main')"
	@echo "${BLUE}Remote:${NC} $(shell git remote get-url origin 2>/dev/null || echo 'None')"

sync:
	@echo "${YELLOW}► Syncing with ${MAIN_BRANCH}...${NC}"
	@git fetch origin
	@git rebase origin/${MAIN_BRANCH}
	@echo "${GREEN}✓ Branch synchronized${NC}"

stage:
	@echo "${YELLOW}► Staging Changes...${NC}"
	@git add .
	@echo "${GREEN}✓ Changes staged:${NC}"
	@git status --short

commit:
	@if [ -z "${MESSAGE}" ]; then \
		echo "${RED}✗ Usage: make commit MESSAGE=\"your commit message\"${NC}"; \
		exit 1; \
	fi
	@echo "${YELLOW}► Committing Changes...${NC}"
	@git commit -m "${MESSAGE}"
	@echo "${GREEN}✓ Changes committed${NC}"

push:
	@echo "${YELLOW}► Pushing to Origin...${NC}"
	@CURRENT_BRANCH=$$(git branch --show-current); \
	git push -u origin $$CURRENT_BRANCH
	@echo "${GREEN}✓ Changes pushed${NC}"

pr:
	@echo "${CYAN}► Creating Pull Request...${NC}"
	@CURRENT_BRANCH=$$(git branch --show-current); \
	echo "${YELLOW}Opening PR for: $$CURRENT_BRANCH → ${MAIN_BRANCH}${NC}"; \
	if command -v gh >/dev/null 2>&1; then \
		gh pr create --base ${MAIN_BRANCH} --fill; \
	else \
		echo "${BLUE}GitHub CLI not installed. Manual PR URL:${NC}"; \
		echo "https://github.com/$$(git remote get-url origin | sed 's/.*github.com[:/]//; s/\.git//')/compare/${MAIN_BRANCH}...$$CURRENT_BRANCH"; \
	fi

amend:
	@echo "${YELLOW}► Amending Last Commit...${NC}"
	@git commit --amend --no-edit
	@echo "${GREEN}✓ Last commit amended${NC}"

undo:
	@echo "${RED}► Undoing Last Commit (Keep Changes)...${NC}"
	@git reset --soft HEAD~1
	@echo "${GREEN}✓ Last commit undone. Changes are staged.${NC}"

backup:
	@echo "${YELLOW}► Creating Emergency Backup...${NC}"
	@BACKUP_NAME="backup-$$(date +%Y%m%d-%H%M%S)"; \
	git stash push -m "$$BACKUP_NAME"; \
	echo "${GREEN}✓ Changes backed up to stash: $$BACKUP_NAME${NC}"

restore:
	@echo "${YELLOW}► Restoring Last Backup...${NC}"
	@git stash pop
	@echo "${GREEN}✓ Backup restored${NC}"

hooks:
	@echo "${CYAN}► Installing Git Hooks...${NC}"
	@mkdir -p .git/hooks
	@echo '#!/bin/sh\nmake lint' > .git/hooks/pre-commit
	@chmod +x .git/hooks/pre-commit
	@echo "${GREEN}✓ Git hooks installed${NC}"

release:
	@if [ -z "${VERSION}" ]; then \
		echo "${RED}✗ Usage: make release VERSION=\"v1.0.0\"${NC}"; \
		exit 1; \
	fi
	@echo "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	@echo "${GREEN}CREATING RELEASE ${VERSION}${NC}"
	@echo "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	@echo "${YELLOW}1. Verifying branch...${NC}"
	@git checkout ${MAIN_BRANCH}
	@git pull origin ${MAIN_BRANCH}
	@echo "${YELLOW}2. Running pre-release checks...${NC}"
	@make verify
	@make build
	@echo "${YELLOW}3. Creating tag...${NC}"
	@git tag -a ${VERSION} -m "Release ${VERSION}"
	@echo "${YELLOW}4. Pushing...${NC}"
	@git push origin ${VERSION}
	@echo "${GREEN}✓ Release ${VERSION} created${NC}"
	@echo "${BLUE}Next: Package AppImage and upload to GitHub${NC}"

hotfix:
	@if [ -z "${ISSUE}" ]; then \
		echo "${RED}✗ Usage: make hotfix ISSUE=\"fix-bug-123\"${NC}"; \
		exit 1; \
	fi
	@echo "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	@echo "${RED}EMERGENCY HOTFIX: ${ISSUE}${NC}"
	@echo "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	@echo "${YELLOW}1. Starting hotfix branch...${NC}"
	@git checkout ${MAIN_BRANCH}
	@git pull origin ${MAIN_BRANCH}
	@git checkout -b hotfix/${ISSUE}
	@echo "${GREEN}✓ Hotfix branch created: hotfix/${ISSUE}${NC}"

# --- HELP ---
help:
	@echo "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	@echo "${GREEN}Greyway.Co / Clue Player — Linux Desktop Media Vault${NC}"
	@echo "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	@echo ""
	@echo "${YELLOW}MAIN INTERFACE:${NC}"
	@echo "  ${GREEN}make${NC}           Interactive menu (recommended)"
	@echo "  ${GREEN}make menu${NC}       Launch interactive command center"
	@echo ""
	@echo "${YELLOW}DEVELOPMENT:${NC}"
	@echo "  ${GREEN}make run${NC}        Run app in debug mode"
	@echo "  ${GREEN}make db${NC}         Regenerate database schema"
	@echo "  ${GREEN}make watch${NC}      Auto-regenerate on changes"
	@echo "  ${GREEN}make fix${NC}        Fix code & format"
	@echo "  ${GREEN}make clean${NC}      Deep clean workspace"
	@echo ""
	@echo "${YELLOW}QUALITY:${NC}"
	@echo "  ${GREEN}make verify${NC}     Full system validation"
	@echo "  ${GREEN}make lint${NC}       Static analysis"
	@echo "  ${GREEN}make test${NC}       Run tests"
	@echo "  ${GREEN}make check${NC}      Check dependencies"
	@echo ""
	@echo "${YELLOW}RELEASE:${NC}"
	@echo "  ${GREEN}make build${NC}      Compile production binary"
	@echo "  ${GREEN}make package${NC}    Create AppImage"
	@echo "  ${GREEN}make release${NC}    Tag release (VERSION=\"v1.0\")"
	@echo ""
	@echo "${YELLOW}GIT WORKFLOW:${NC}"
	@echo "  ${GREEN}make status${NC}     Repository status"
	@echo "  ${GREEN}make stage${NC}      Stage all changes"
	@echo "  ${GREEN}make commit${NC}     Commit (MESSAGE=\"...\")"
	@echo "  ${GREEN}make push${NC}       Push to origin"
	@echo "  ${GREEN}make sync${NC}       Rebase on main"
	@echo "  ${GREEN}make pr${NC}         Create pull request"
	@echo ""
	@echo "${YELLOW}EMERGENCY:${NC}"
	@echo "  ${GREEN}make undo${NC}       Undo last commit"
	@echo "  ${GREEN}make amend${NC}      Amend last commit"
	@echo "  ${GREEN}make backup${NC}     Stash emergency backup"
	@echo "  ${GREEN}make restore${NC}    Restore last backup"
	@echo "  ${GREEN}make hotfix${NC}     Emergency fix (ISSUE=\"...\")"
	@echo ""
	@echo "${YELLOW}UTILITIES:${NC}"
	@echo "  ${GREEN}make prepare${NC}    Fresh project install"
	@echo "  ${GREEN}make purge${NC}      Remove build artifacts"
	@echo "  ${GREEN}make hooks${NC}      Install git hooks"
	@echo "  ${GREEN}make riverpod-debug${NC}  Debug generator issues"
	@echo ""
	@echo "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	@echo "${BLUE}Local-First | Linux Desktop | Media Vault${NC}"
	@echo "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"