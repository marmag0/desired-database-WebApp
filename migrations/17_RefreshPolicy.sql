-- niezbędne by nowe dane były uwzględnianie w CA MV

-- ręczny refresh (może być oskryptowany w celu wywoływania co "ileś" insertów - mało wydajne i zasobortzerne)
-- nie mogą działać w bloku transakcyjnym => każdy musi być osobno oskryptowany
-- window_start => NULL == od początku istnienia MV

CALL refresh_continuous_aggregate('measurements_per_min',
    window_start => NULL,
    window_end   => now());

CALL refresh_continuous_aggregate('measurements_per_hour',
    window_start => NULL,
    window_end   => now());

CALL refresh_continuous_aggregate('measurements_per_day',
    window_start => NULL,
    window_end   => now());

-- refresh policy, które odświerzają CA MV obejmując dane z przedziału [(start_offset), (end_offset)]:
-- przedział ustawiony na 7 dni wstecz (w razie potrzeby można zmienić)
-- jeśli nowe dane starsze niz 7 dni - ręczne odświerzenie (skrypty powyżej)

SELECT add_continuous_aggregate_policy('measurements_per_min',
    start_offset => INTERVAL '1 hour',
    end_offset => NULL,
    schedule_interval => INTERVAL '1 min');

SELECT add_continuous_aggregate_policy('measurements_per_hour',
    start_offset => INTERVAL '1 day',
    end_offset => NULL,
    schedule_interval => INTERVAL '1 hour');

SELECT add_continuous_aggregate_policy('measurements_per_day',
    start_offset => INTERVAL '7 day',
    end_offset => NULL,
    schedule_interval => INTERVAL '1 day');