Ideas

# config option of how many total labs
# allow gang leaders to buy a lab for a set lab price depending on the type of lab

# if a database table exists end otherwise create the table
trigger event to create a database table with id, name of gang, lab type, lab price, lab fee

# leader purchases a lab
 trigger an event to add the lab to a table in the database

# cron job to run on a config timer to remove money from a gang account to pay for the upkeep of the lab
# lose your lab if you miss a payment ---- potential config grace period?
 trigger event to remove lab from database

# ability for a gang leader to give up their lab
 trigger event to remove lab from database
# ability for gang leader to sell their lab to another gang leader
 trigger event to transfer gang ownership in database

# anybody in the gang would have keys to the lab

# ability for PD to perform a raid on a lab if they find it

# AI mission / bulk sell large quant
onMission = false

while onMission == true
    Create thread
        check how many packages on player
            check how many packages deposited
                if packages deposited == config.missionAmount
                    end job
                    onMission = false
                    payout config.payout
                end
            end
        end
    end
end