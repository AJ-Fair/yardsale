import React from 'react'
import UserItemTile from "./UserItemTile"

const UserItemsComponent = props => {

  const userItems = props.user.items.map((item) => {
    return (
      <UserItemTile key={item.id} item={item}/>
    )
  })
  
  let title
  if (props.user.id === props.currentUser.id) {
    title = `You have no items!`
    if (userItems !== []) {
      title = `You have posted ${userItems.length} items:`
    }
  } else {
    title = `${props.user.user_name} has no items`
    if (userItems !== []) {
      title = `${props.user.user_name} has posted ${userItems.length} items:`
    }
  }

  return (
    <div id="user-items-component">
      <div className="user-items-title">
        <h3>{title}</h3>
      </div>
      <div id="tile-field" className="grid-x grid-margin-x grid-margin-y">
        {userItems}
      </div>
    </div>
  )
}

export default UserItemsComponent