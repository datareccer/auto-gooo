(Must be executable: chmod +x start.sh)  
bash

#!/usr/bin/env bash
# start.sh — Streamlit launcher for Render and all cloud platforms
set -e

# Render always sets PORT; this ensures correct binding
: "${PORT:?PORT variable not set; Render sets this automatically}"

export STREAMLIT_SERVER_ENABLECORS="false"
export STREAMLIT_SERVER_HEADLESS="true"
export STREAMLIT_BROWSER_GATHER_USAGE_STATS="false"

exec streamlit run app.py --server.address 0.0.0.0 --server.port "$PORT"
