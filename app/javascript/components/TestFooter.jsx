import React, { useState } from "react";

export default function TestFooter() {
  const [words, setWords] = useState([]);

  const addWord = () => {
    setWords((prevWords) => {
      return [
        'newWord',
        ...prevWords
      ];
    });
  };

  return <div onClick={() => addWord()}>
    Add a word
    {words.map((word) => {
      return <h1>
        {word}
      </h1>
    })}
  </div>
}
