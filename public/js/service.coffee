# define my own service
fantastic.service 'postService', ->
    posts = null
    addPosts = (data) ->
        posts = data
        console.log "a", posts

    getPosts = ->
        console.log posts
        posts
    addPosts: addPosts,
    getPosts: getPosts