SELECT
CAST(AVG(COALESCE(NULLIF(rsa_time, 0), max.maxrsatime)) AS DECIMAL(15,2)) AS avg_rsa_time,
CAST(AVG(COALESCE(NULLIF(hyper_pulse_time, 0), max.maxpulse)) AS DECIMAL(15,2)) AS avg_hyper_pulse_time,
CAST(AVG(COALESCE(NULLIF(quantum_x_time, 0), max.maxquantum)) AS DECIMAL(15,2)) AS avg_quantum_x_time,
CAST(AVG(COALESCE(NULLIF(aes_time, 0), max.maxaes)) AS DECIMAL(15,2)) AS avg_aes_time,
CAST(AVG(COALESCE(NULLIF(d_crypt_time, 0), max.maxdcrypt)) AS DECIMAL(15,2)) AS avg_d_crypt_time
FROM dtf.madelines_files_results,
(SELECT
    max(rsa_time) as maxrsatime,
    max(hyper_pulse_time) as maxpulse,
    max(quantum_x_time) as maxquantum,
    max(aes_time) as maxaes,
    max(d_crypt_time) as maxdcrypt
    FROM dtf.madelines_files_results
) AS max;
