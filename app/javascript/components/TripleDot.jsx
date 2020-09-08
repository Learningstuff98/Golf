import React, { useState, useEffect } from 'react';

export default function TripleDot({ message }) {
  const [dots, setDots] = useState("");

  useEffect(() => {
    const interval = setInterval(() => {
      handleSettingDots();
    }, 750);
    return () => clearInterval(interval);
  });

  const handleSettingDots = () => {
    if(dots === "") {
      setDots(" .");
    }
    if(dots === " .") {
      setDots(" . .");
    }
    if(dots === " . .") {
      setDots(" . . .");
    }
    if(dots === " . . .") {
      setDots("");
    }
  };

  return <div>
    {message}{dots}
  </div>  
}
