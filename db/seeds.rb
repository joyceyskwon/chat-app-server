puts "destroy feeds"
Feed.destroy_all
puts "create feeds"
Feed.create!([{
    name: 'test feed'
},
{
    name: 'test feed2'
}])
puts "created feeds"
