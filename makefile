# =============================================================================
# Variables
# =============================================================================
BUILD_FILE := userstyle.css
DIST_FILE := dist/hacker-news-modern-ui.user.css
SRC_DIR := src
CSS_FILES := $(shell find $(SRC_DIR) -type f -name '*.css')

GREEN := \033[92m
YELLOW := \033[0;33m
CYAN := \033[0;36m
RED := \033[0;31m
FMT_END := \033[0m

# =============================================================================
# Distribution File 
# =============================================================================
$(DIST_FILE): userstyle.header.css $(BUILD_FILE) $(CSS_FILES)
	$(shell ./build.sh $(BUILD_FILE) $(DIST_FILE))
	@if [ $$? -eq 0 ]; then \
		echo "\n$(GREEN)Build complete. Output: $(DIST_FILE)\n$(FMT_END)"; \
	else \
		echo "\n$(RED)Build failed.\n$(FMT_END)"; \
	fi


# =============================================================================
# Watch Command
# =============================================================================
.PHONY: watch
watch:
	@which fswatch > /dev/null || (echo "$(RED)⚠️  ERROR: Command 'fswatch' not found. Make sure it is installed and in your system path.$(FMT_END)\n" && exit 1;)
	@clear;
	@$(MAKE);
	@echo "\n🔎 Watching for changes … \n"
	@echo "[To $(RED)STOP$(FMT_END), press $(GREEN)CTRL-C$(FMT_END)]\n"
	@while true; do \
        changed_file=$$(fswatch -1 .); \
        echo "File changed: $$changed_file"; \
        $(MAKE); \
	done

	