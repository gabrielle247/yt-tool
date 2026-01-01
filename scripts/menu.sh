#!/bin/bash

# ==========================================
# GREYWAY.CO | CLUE PLAYER | COMMAND CENTER
# ==========================================

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

PROJECT_NAME="Clue Player"
VERSION="1.0.0"

# Function to show header
show_header() {
    clear
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}   GREYWAY.CO  |  CLUE PLAYER  |  COMMAND CENTER${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}Local-First Linux Desktop Media Vault${NC}"
    echo ""
}

# Function to show status
show_status() {
    echo -e "${YELLOW}Project Status:${NC}"
    echo -e "  Branch: $(git branch --show-current 2>/dev/null || echo 'main')"
    echo -e "  Changes: $(git status --short | wc -l 2>/dev/null || echo 0)"
    echo ""
}

# Function to run and wait
run_and_wait() {
    echo ""
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    eval "$1"
    echo ""
    read -p "Press Enter to continue..."
}

# Main menu
while true; do
    show_header
    show_status
    
    echo -e "${YELLOW}DEVELOPMENT:${NC}"
    echo -e "  1) ${GREEN}Run App${NC} (Linux Debug)"
    echo -e "  2) ${GREEN}Rebuild Database${NC} (Fix Schema/Providers)"
    echo -e "  3) ${GREEN}Watch Mode${NC} (Auto-generate)"
    echo -e "  4) ${GREEN}Fix & Format${NC} (Standardize Code)"
    echo -e "  5) ${GREEN}Clean & Reset${NC} (Deep Clean)"
    
    echo ""
    echo -e "${YELLOW}QUALITY:${NC}"
    echo -e "  6) ${GREEN}Verify System${NC} (Check Dependencies)"
    echo -e "  7) ${GREEN}Run Tests${NC}"
    echo -e "  8) ${GREEN}Static Analysis${NC}"
    
    echo ""
    echo -e "${YELLOW}GIT WORKFLOW:${NC}"
    echo -e "  9) ${GREEN}Git Status${NC}"
    echo -e "  10) ${GREEN}Commit & Push${NC}"
    echo -e "  11) ${GREEN}Sync Branch${NC} (Rebase on main)"
    echo -e "  12) ${GREEN}Emergency Tools${NC}"
    
    echo ""
    echo -e "${YELLOW}RELEASE:${NC}"
    echo -e "  13) ${GREEN}Build Binary${NC} (Production)"
    echo -e "  14) ${GREEN}Package AppImage${NC}"
    echo -e "  15) ${GREEN}Create Release${NC}"
    
    echo ""
    echo -e "${YELLOW}UTILITIES:${NC}"
    echo -e "  16) ${GREEN}Project Bootstrap${NC} (Fresh Install)"
    echo -e "  17) ${GREEN}Debug Riverpod${NC}"
    echo -e "  18) ${GREEN}Make Help${NC} (Full Command List)"
    
    echo ""
    echo -e "  0) ${RED}Exit${NC}"
    echo ""
    
    read -p "Select an option [0-18]: " choice

    case $choice in
        1) run_and_wait "make run" ;;
        2) run_and_wait "make db" ;;
        3) 
            echo -e "${CYAN}Starting watch mode (Ctrl+C to stop)...${NC}"
            make watch
            break
            ;;
        4) run_and_wait "make fix" ;;
        5) run_and_wait "make clean" ;;
        6) run_and_wait "make check" ;;
        7) run_and_wait "make test" ;;
        8) run_and_wait "make lint" ;;
        9) run_and_wait "make status" ;;
        10) 
            show_header
            echo -e "${YELLOW}Commit & Push Workflow:${NC}"
            echo ""
            make stage
            echo ""
            read -p "Commit Message: " msg
            if [ -n "$msg" ]; then
                make commit MESSAGE="$msg"
                make push
            else
                echo -e "${RED}No commit message provided.${NC}"
            fi
            read -p "Press Enter to continue..."
            ;;
        11) run_and_wait "make sync" ;;
        12)
            show_header
            echo -e "${YELLOW}Emergency Tools:${NC}"
            echo ""
            echo -e "  a) ${RED}Undo Last Commit${NC} (Keep changes)"
            echo -e "  b) ${RED}Amend Last Commit${NC}"
            echo -e "  c) ${YELLOW}Create Backup${NC}"
            echo -e "  d) ${YELLOW}Restore Backup${NC}"
            echo -e "  e) ${GREEN}Install Git Hooks${NC}"
            echo ""
            read -p "Select tool [a-e]: " tool
            case $tool in
                a) run_and_wait "make undo" ;;
                b) run_and_wait "make amend" ;;
                c) run_and_wait "make backup" ;;
                d) run_and_wait "make restore" ;;
                e) run_and_wait "make hooks" ;;
                *) echo -e "${RED}Invalid option${NC}"; sleep 1 ;;
            esac
            ;;
        13) run_and_wait "make build" ;;
        14) run_and_wait "make package" ;;
        15)
            show_header
            echo -e "${YELLOW}Create Release:${NC}"
            echo ""
            read -p "Release Version (e.g., v1.0.0): " version
            if [ -n "$version" ]; then
                make release VERSION="$version"
            else
                echo -e "${RED}No version provided.${NC}"
            fi
            read -p "Press Enter to continue..."
            ;;
        16) run_and_wait "make prepare" ;;
        17) run_and_wait "make riverpod-debug" ;;
        18) run_and_wait "make help" ;;
        0) 
            echo -e "${GREEN}Exiting... Happy coding!${NC}"
            exit 0
            ;;
        *) 
            echo -e "${RED}Invalid option${NC}"
            sleep 1
            ;;
    esac
done