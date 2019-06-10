README.md: $(shell find . -name "*.yaml")
	echo '### Available _jq methods_:' > README.md
	echo '' >> README.md
	for m in $$(ls *.yaml); do \
      echo "* [\`$$(echo $$m | tr "." "\n" | head -n 1)\`]($$(echo $$m)):" >> README.md; \
      echo  "" >> README.md; \
      echo -n "  " >> README.md; \
      yq.v2 read $$m description | perl -p -e 's/\n/\n  /g' >> README.md; \
      echo ''; \
    done;
