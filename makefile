OUTPUT_FILE := hacker-news-modern-ui.css
INDEX_FILE := manifest.txt
SRC_DIR := src

GREEN := \033[92m
YELLOW := \033[0;33m
CYAN := \033[0;36m
RED := \033[0;31m
FMT_END := \033[0m

# =============================================================================

$(OUTPUT_FILE): $(wildcard $(SRC_DIR)/*.css)
	@cat $$(more $(INDEX_FILE)) > $(OUTPUT_FILE)
	@echo "\nBuild complete. Output:\n$(OUTPUT_FILE)\n"


.PHONY: watch
watch:
	@which fswatch > /dev/null || (echo "$(RED)⚠️  ERROR: Command 'fswatch' not found. Make sure it is installed and in your system path.$(FMT_END)\n" && exit 1;)
	@clear;
	@$(MAKE);
	@echo "\n🔎 Watching assets for changes … \n"
	@echo "[To $(RED)STOP$(FMT_END), double-press $(GREEN)CTRL-C$(FMT_END)]\n"
	@while true; do \
		fswatch -1 $(INDEX_FILE) $(SRC_DIR) | xargs echo '{}' > /dev/null && $(MAKE); \
		sleep 1; \
	done