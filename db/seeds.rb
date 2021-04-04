# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Url.create([
    {
        long_url: "FirstLongUrl",
        short_url: "FirstShortUrl",
        ip: "FirstIp"
    },
    {
        long_url: "SecondLongUrl",
        short_url: "SecondShortUrl",
        ip: "SecondIp"
    },
    {
        long_url: "ThirdLongUrl",
        short_url: "ThirdShortUrl",
        ip: "ThirdIp"
    },
    {
        long_url: "FourthLongUrl",
        short_url: "FourthShortUrl",
        ip: "FirstIp"
    }
])