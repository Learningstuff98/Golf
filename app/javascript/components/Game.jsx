import React, { useState, useEffect } from 'react';
import Players from './Players';

export default function Game({ initialPlayers }) {
  const [players, setPlayers] = useState([]);

  useEffect(() => {
    setPlayers(initialPlayers);
  }, []);

  const renderPlayers = () => {
    return <Players
      players={players}
    />
  };

  return <div>
    {renderPlayers()}
  </div>
}
