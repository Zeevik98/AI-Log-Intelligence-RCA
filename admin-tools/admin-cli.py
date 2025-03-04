#!/usr/bin/env python3

"""
Generic administrative CLI (non-UI).
This might let you run commands like:
  - python admin-cli.py list-agents
  - python admin-cli.py trigger-llm
"""

import sys

def main():
    if len(sys.argv) < 2:
        print("Usage: admin-cli.py <command>")
        sys.exit(1)

    command = sys.argv[1]
    if command == "list-agents":
        print("Listing all agent configs from agent-configs/ ...")
    elif command == "trigger-llm":
        print("Triggering LLM job now...")
    else:
        print(f"Unknown command: {command}")

if __name__ == "__main__":
    main()
