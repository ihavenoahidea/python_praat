form Arguments
    infile: "File_path", "default"
endform

sound = Read from file: file_path$
intensity = To Intensity: 90, 0, "yes"
intensity_min = Get minimum: 0, 0, "parabolic"
intensity_max = Get maximum: 0, 0, "parabolic"
intensity_mean = Get mean: 0, 0, "energy"
# Remove: intensity
selectObject: sound
pitch = To Pitch: 0, 75, 600
f0_min = Get minimum: 0, 0, "Hertz", "parabolic"
f0_max = Get maximum: 0, 0, "Hertz", "parabolic"
f0_mean = Get mean: 0, 0, "Hertz"
# Remove: pitch
selectObject: sound
To Formant (burg): 0, 4, 4000, 0.025, 50
f1_min = Get minimum: 1, 0, 0, "hertz", "parabolic"
f1_max = Get maximum: 1, 0, 0, "hertz", "parabolic"
f1_mean = Get mean: 1, 0, 0, "hertz"
f2_min = Get minimum: 2, 0, 0, "hertz", "parabolic"
f2_max = Get maximum: 2, 0, 0, "hertz", "parabolic"
f2_mean = Get mean: 2, 0, 0, "hertz"
f3_min = Get minimum: 3, 0, 0, "hertz", "parabolic"
f3_max = Get maximum: 3, 0, 0, "hertz", "parabolic"
f3_mean = Get mean: 3, 0, 0, "hertz"
f4_min = Get minimum: 4, 0, 0, "hertz", "parabolic"
f4_max = Get maximum: 4, 0, 0, "hertz", "parabolic"
f4_mean = Get mean: 4, 0, 0, "hertz"
writeFileLine: ".\TEMP.txt",  f0_min, "," , f0_max, "," , f0_mean, "," , intensity_min, "," , intensity_max, "," , intensity_mean, "," , f1_min, "," , f1_max, "," , f1_mean, "," , f2_min, "," , f2_max, "," , f2_mean, "," , f3_min, "," , f3_max, "," , f3_mean, "," , f4_min, "," , f4_max, "," , f4_mean

