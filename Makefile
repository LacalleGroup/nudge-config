.PHONY: validate-json

validate-json:
	@echo "Validating JSON files..."
	@find . -name "*.json" -type f -print0 | xargs -0 -n1 -I{} sh -c 'echo "Checking {}..." && cat {} | jq . > /dev/null || (echo "Error in {}" && exit 1)'
	@echo "All JSON files are valid!"
