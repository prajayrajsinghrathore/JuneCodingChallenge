-module(drone_distribution).
-export([distribute_packages/2]).

distribute_packages(MaxCapacity, PackageWeights) ->
    SortedWeights = lists:sort(fun(A, B) -> A > B end, PackageWeights),
    distribute(SortedWeights, MaxCapacity, []).

distribute([], _MaxCapacity, Drones) ->
    lists:reverse(Drones);
distribute([Weight | RestWeights], MaxCapacity, Drones) ->
    case try_place_package(Weight, MaxCapacity, Drones) of
        {ok, UpdatedDrones} ->
            distribute(RestWeights, MaxCapacity, UpdatedDrones);
        error ->
            distribute(RestWeights, MaxCapacity, [[Weight] | Drones])
    end.

try_place_package(_Weight, _MaxCapacity, []) ->
    error;
try_place_package(Weight, MaxCapacity, [Drone | RestDrones]) ->
    CurrentLoad = lists:sum(Drone),
    if
        CurrentLoad + Weight =< MaxCapacity ->
            {ok, [[Weight | Drone] | RestDrones]};
        true ->
            case try_place_package(Weight, MaxCapacity, RestDrones) of
                {ok, UpdatedDrones} ->
                    {ok, [Drone | UpdatedDrones]};
                error ->
                    error
            end
    end.

main(_) -> io:write(distribute_packages(50, [10,20,30,40,15,25,35,45])).