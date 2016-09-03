module Components.Examples.RestaurantData exposing (..)


type alias URL = String

type alias Restaurant =
    { name : String
    , fare : String
    , image : URL
    }


restaurants : List Restaurant
restaurants =
    -- TODO images
    [ { name = "Ruth's Cafe", fare = "Grill", image = "" }
    , { name = "Takashi", fare = "Japanese", image = "" }
    , { name = "Wasatch Brew Pub", fare = "Pub", image = "" }
    , { name = "Little Saigon", fare = "Vietnamese", image = "" }
    ]


type alias Dish =
    { name : String
    , price : Float
    }


dishes : List Dish
dishes =
    [ { name = "Green Salad", price = 8 }
    , { name = "Omelet", price = 7 }
    , { name = "Burger", price = 9 }
    , { name = "Seared Tuna Sashimi", price = 6 }
    , { name = "Soup of the day", price = 5 }
    , { name = "Banh Mi Sandwhich", price = 7 }
    ]
