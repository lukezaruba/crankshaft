CREATE OR REPLACE FUNCTION
    crankshaft.PyAggS(current_state Numeric[], current_row Numeric[])
    returns NUMERIC[] as $$
    BEGIN
        if array_upper(current_state,1) is null  then
            RAISE NOTICE 'setting state %',array_upper(current_row,1);
            current_state[1] = array_upper(current_row,1);
        end if;
        return array_cat(current_state,current_row) ;
    END
    $$ LANGUAGE plpgsql IMMUTABLE PARALLEL SAFE;

-- Create aggregate if it did not exist
DO $$ BEGIN
    CREATE AGGREGATE crankshaft.PyAgg(NUMERIC[]) (
        SFUNC = crankshaft.PyAggS,
        STYPE = Numeric[],
        PARALLEL = SAFE,
        INITCOND = "{}"
    );
EXCEPTION
    WHEN duplicate_function THEN NULL;
END $$;

-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
