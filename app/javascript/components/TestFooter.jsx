import React, { useState } from 'react';

export default function TestFooter() {
  const [words, setWords] = useState([]);

  const handleClick = () => {
    setWords((prevWords) => {
      return [
        <div>newWord</div>,
        ...prevWords
      ];
    });
  };

  return <h1 className="green" onClick={() => handleClick()}>
    TestFooter
    {words}
  </h1>
}
