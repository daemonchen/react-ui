package controllers

import (
    "encoding/json"
    "github.com/jgraham909/revmgo"
    "github.com/revel/revel"
    "react-ui/app/models"
)

type User struct {
    *revel.Controller
    revmgo.MongoController
}

func (c User) Index() revel.Result {
    return c.Render()
}
func (c User) Register(user *models.User) revel.Result {
    decoder := json.NewDecoder(c.Request.Body)
    decoder.Decode(&user)
    if user.Meta == nil {
        user.Meta = make(map[string]interface{})
    }
    user.Meta["type"] = 2 //普通用户
    // revel.WARN.Println(user)
    err := user.Save(c.MongoSession)
    if err != nil {
        return c.RenderJson(&user)
    }
    return c.RenderJson(&user)
}
