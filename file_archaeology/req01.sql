SELECT min(size) FILTER ( WHERE filename ilike '%secret%') AS smallest_secret_file_size,
min(size) AS smallest_file_size FROM dtf.madelines_files;

