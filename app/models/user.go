package models

import (
    // "encoding/json"
    // "fmt"
    "labix.org/v2/mgo"
    "labix.org/v2/mgo/bson"
)

type User struct {
    Id       bson.ObjectId          `bson:"_id,omitempty"`
    Name     string                 `bson:"name"`
    Email    string                 `bson:"email"`
    Password string                 `bson:"password"`
    Meta     map[string]interface{} `bson:",omitempty"`
    // Type         int           `bson:"type"` //1管理员，2普通用户
    // Avatar       string        `bson:"avatar,omitempty"`
    // Permissions  map[int]int   `bson:"permissions,omitempty"`
    // ValidateCode string        `bson:"validateCode,omitempty"`
    // IsActive     bool          `bson:"isActive"`
    // Created      int           `bson:"created"`
    // Updated      int           `bson:"updated"`
}

func getCollection(s *mgo.Session) *mgo.Collection {
    return s.DB("react-ui").C("user")
}

func (u *User) Save(s *mgo.Session) error {
    _, err := getCollection(s).Upsert(bson.M{"name": u.Name}, u)
    return err
}

func (b *User) Delete(s *mgo.Session) error {
    return getCollection(s).RemoveId(b.Id)
}
