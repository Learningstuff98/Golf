import React, { useState } from 'react';

export default function TestHeader() {
  const [words, setWords] = useState([]);

  const handleClick = () => {
    setWords((prevWords) => {
      return [
        'newWord',
        ...prevWords
      ];
    });
  };

  return <h1 onClick={() => handleClick()}>
    TestHeader
    {words}
  </h1>
}
