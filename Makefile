lint:
	-codespell
	-isort .
	-black .
	-ruff check . --fix
	-ruff format .
	-mypy --pretty .
update:
	-uv lock --upgrade
	-pre-commit autoupdate
sec:
	-safety scan --apply-fixes
	-bandit -r .
	-gitleaks dir . --verbose --report-format=json --report-path=gitleaks-report.json
test:
	-coverage run -m pytest
	-coverage html --directory coverage/html
	-coverage report
