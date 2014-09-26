package models

import (
    // "encoding/json"
    // "github.com/russross/blackfriday"
    "labix.org/v2/mgo"
    "labix.org/v2/mgo/bson"
)

type Article struct {
    Id      bson.ObjectId          `bson:"_id,omitempty"`
    Title   string                 `bson:"title"`
    Content string                 `bson:"content"`
    Stamp   string                 `bson:"stamp,omitempty"`
    Meta    map[string]interface{} `bson:",omitempty"`
}

func getPostsCollection(s *mgo.Session) *mgo.Collection {
    return s.DB("react-ui").C("articles")
}
