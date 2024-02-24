SELECT
    gusto_guests.id,
    reservation_id
FROM public.gusto_reservations, public.gusto_guests
WHERE
    reservation_date >= '2059-12-03 18:00:00' AND
    reservation_date <= '2059-12-03 21:00:00' AND
    cancelled = false AND
    gusto_reservations.id = gusto_guests.reservation_id;
