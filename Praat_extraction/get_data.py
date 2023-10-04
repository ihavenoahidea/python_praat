import os, csv, subprocess
from pathlib import Path

wd = Path("./")
os.chdir(wd)

directory_to_analyze = Path("./clipped_vowels/")
files_to_analyze = list(directory_to_analyze.glob('*.wav'))
output_file = Path("./Praat_extraction/") / (directory_to_analyze.stem + "_output.csv")
error_file = Path("./Praat_extraction/") / (directory_to_analyze.stem + "_errors.txt")
temp_file = Path("./Praat_extraction/TEMP.txt")
with open(error_file, 'w', encoding='utf-8', newline='') as error:
    with open(output_file, 'w', encoding='utf-8', newline='') as output:
        writer = csv.writer(output)
        header = ["clip_name", "f0_min", "f0_max", "f0_mean", "intensity_min", "intensity_max", "intensity_mean", "f1_min", "f1_max", "f1_mean", "f2_min", "f2_max", "f2_mean", "f3_min", "f3_max", "f3_mean", "f4_min", "f4_max", "f4_mean"]
        writer.writerow(header)
        for file in files_to_analyze:
            completed_process = subprocess.run("C:\\Program Files\\Praat\\Praat.exe --run Praat_extraction\\extraction_script.praat " + str(file), stdout = subprocess.PIPE, stderr=subprocess.PIPE, text = True)
            tempfile = Path("./Praat_extraction/TEMP.txt")
            error.write(completed_process.stdout)
            error.write(completed_process.stderr)
            with open(tempfile, 'r', encoding='utf-8') as data:
                text = data.read().strip().split(',') # To troubleshoot, break this along different lines. 
                text = [file.name] + text
                writer.writerow(text)