phase_timer--;

if (phase_timer <= 0)
{
    cleanup_phase();
    spawn_phase();
    phase_timer = round(room_speed * phase_seconds);
}