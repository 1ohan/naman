#!/usr/bin/env bash
# run.sh — Launch the Maritime Freight Intelligence dashboard
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VENV="$SCRIPT_DIR/venv"

# Create venv if it doesn't exist
if [ ! -d "$VENV" ]; then
    echo "🔧 Creating virtual environment..."
    python3 -m venv "$VENV"
fi

# Install dependencies
echo "📦 Installing dependencies..."
"$VENV/bin/pip" install -q -r "$SCRIPT_DIR/requirements.txt"

# Launch Streamlit
echo "🚀 Launching Maritime Freight Intelligence Dashboard..."
echo "   Open http://localhost:8501 in your browser"
echo ""
"$VENV/bin/streamlit" run "$SCRIPT_DIR/app/dashboard.py" \
    --server.headless true \
    --server.address 0.0.0.0 \
    --server.port 8501 \
    --browser.gatherUsageStats false
