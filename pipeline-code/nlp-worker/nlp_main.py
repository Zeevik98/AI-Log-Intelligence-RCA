import os
import glob
import json

CHUNK_SIZE = 5000  # lines per chunk, adjustable based on memory constraints

def process_chunk(chunk_lines, chunk_index):
    # Placeholder for Longformer inference
    # Summarize or parse these lines
    summary = f"Chunk {chunk_index} summary of {len(chunk_lines)} lines."
    return {"chunk_index": chunk_index, "summary": summary}

def main():
    log_dir = "/data/logs"   # or a user-defined location
    output_file = "/data/nlp-output.json"

    all_files = glob.glob(os.path.join(log_dir, "*.log"))
    results = []

    for fpath in all_files:
        with open(fpath, "r") as f:
            lines_buffer = []
            chunk_index = 0

            for line in f:
                lines_buffer.append(line)
                if len(lines_buffer) >= CHUNK_SIZE:
                    results.append(process_chunk(lines_buffer, chunk_index))
                    lines_buffer = []
                    chunk_index += 1

            # Process leftover lines
            if lines_buffer:
                results.append(process_chunk(lines_buffer, chunk_index))

    with open(output_file, "w") as out:
        json.dump({"chunks": results}, out, indent=2)

    print("NLP stage completed with chunking logic.")

if __name__ == "__main__":
    main()
