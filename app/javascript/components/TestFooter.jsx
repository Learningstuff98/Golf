import React, { useState } from 'react';

export default function TestFooter() {
  const [words, setWords] = useState([]);

  const addWord = () => {
    setWords((prevWords) => {
      return [
        <h1>newWord</h1>,
        ...prevWords
      ];
    });
  };

  return <div class="green" onClick={() => addWord()}>
    TestFooter
    {words}
  </div>
}
