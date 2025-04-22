OUTPUT="$(flutter analyze)"
echo "$OUTPUT"
echo
if grep -q "error •" echo "$OUTPUT"; then
    echo "flutter analyze found errors"
    exit 1
else
    echo "flutter analyze: OK"
    exit 0
fi