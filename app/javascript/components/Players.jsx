import React from 'react';

export default function Players({ players }) {

  const buildPlayerList = () => {
    return players.map((player) => {
      return <div key={player.id}>
        {player.username}
      </div>
    });
  };

  return <div>
    Players:
    {buildPlayerList()}
  </div>
}
