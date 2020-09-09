import React, { useState, useEffect } from 'react';
import Players from './Players';
import consumer from "channels/consumer"

export default function Game({ initialPlayers, game }) {
  const [players, setPlayers] = useState([]);

  useEffect(() => {
    setPlayers(initialPlayers);
    handleWebsocketUpdates();
  }, []);

  const handleWebsocketUpdates = () => {
    consumer.subscriptions.create({channel: "GameChannel"}, {
      received(data) {
        if(game.id === data.players[0].game_id) {
          setPlayers(data.players);
        }
      }
    });
  };

  const renderPlayers = () => {
    return <Players
      players={players}
    />
  };

  return <div>
    {renderPlayers()}
  </div>
}
