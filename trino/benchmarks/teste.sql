select
    "tc_events".*,
    "tc_devices"."name" as "device_name",
    "tc_devices"."category",
    "tc_devices"."phone",
    "tc_devices"."uniqueid",
    "tc_devices"."commandid" as "model",
    "tc_events"."attributes",
    "tc_drivers"."name" as "driver_name",
    "tc_vehicles"."brand",
    "tc_vehicles"."model" as "model2",
    "tc_vehicles"."plate",
    "tc_groups"."name" as "group_name",
    "tc_events_read"."read",
    "tc_events_read"."note",
    TO_CHAR(tc_events.eventtime, 'DD/MM/YYYY HH24:MI:SS') AS date
from
    "tc_events"
    inner join "tc_devices" on "tc_events"."deviceid" = "tc_devices"."id"
    inner join "tc_vehicle_device" on "tc_vehicle_device"."deviceid" = "tc_devices"."id"
    inner join "tc_vehicles" on "tc_vehicles"."id" = "tc_vehicle_device"."vehicleid"
    inner join "tc_groups" on "tc_vehicles"."groupid" = "tc_groups"."id"
    left join "tc_events_read" on "tc_events_read"."eventid" = "tc_events"."id"
    and "tc_events_read"."userid" = 3
    left join "tc_device_driver" on "tc_devices"."id" = "tc_device_driver"."deviceid"
    left join "tc_drivers" on "tc_device_driver"."driverid" = "tc_drivers"."id"
where
    "tc_vehicles"."groupid" = 11239
    and "tc_devices"."id" = 5229
    and "tc_events"."eventtime" >= '2024-01-01 00:00:00'
    and "tc_events"."eventtime" <= '2024-05-27 23:59:00'
    and (
        tc_events_read.read IS NULL
        OR tc_events_read.read = false
    )
    and "tc_events"."type" = '{}'