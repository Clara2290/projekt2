<script>
import {goto} from '$app/navigation';
    let dairy = [];
    let content1 = ''; 
    let content2 = ''; 
    let content3 = ''; 
    let content4 = ''; 
    let content5 = ''; 

    const saveDiary = async () => {
        const combinedContent = `${content1}\n${content2}\n${content3}\n${content4}\n${content5}`; 
        await fetch('/api/diary', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                content: combinedContent
            })
        });
        
    };

    import { onMount } from 'svelte';
    onMount(async () => {
        const res = await fetch('/api/diary/self');
        const previousEntries = await res.json();
        dairy = await res.json();
        
    });

    async function inputknap(){
    const res = await fetch('/api/diary/self');
        dairy = await res.json();
        if (previousEntries.length > 5) {
        dairy = previousEntries.slice(-5);
    } else {
        dairy = previousEntries;
    }
        
    }

    function navigationTostart() {
        goto('/api/start');}
    
    
    const logout = async () => {
        const response = await fetch('/api/logud', {
            method: 'GET'
        });
        if (response.status === 200) {
            alert('Du er logget ud!');
            window.location = '/'; 
        } else {
            alert('Der opstod en fejl under log ud-processen.');
        }
    };
    
</script>

<img src="/logo.png" alt="Logo">
<style> img{
    width: 30%;
}


    input[type="text"] {
        width: 500px; 
        height: 40px; 
        font-size: 16px; 
        margin-bottom: 20px; 
    }

    button {
        background-color: #42a5f5;
        color: white; 
        border: none; 
        padding: 20px 30px; 
        margin: 5px; 
        border-radius: 10px; 
    }
    
    .logud{
    float: right;
    margin-top: 80px;
    }

.save-button {
  margin-right: 300px;
}
.inputknap {
    position: absolute; 
      top: 220px;
      right: 350px;
    }

</style>

<h3>
    Hvad gør dig stresset?
</h3>


<div>
    <input bind:value={content1} type="text" placeholder="Skriv her" />
</div>

<div>
    <input bind:value={content2} type="text" placeholder="Skriv her" />
</div>

<div>
    <input bind:value={content3} type="text" placeholder="Skriv her" />

</div>

<div>
    <input bind:value={content4} type="text" placeholder="Skriv her" />
</div>

<div>
    <input bind:value={content5} type="text" placeholder="Skriv her" />
</div>

<div>
        <button class="save-button" on:click={saveDiary}>Gem</button>
    <button on:click={navigationTostart}>Tilbage</button>
  </div>

<div class="logud">
<button on:click={logout}>Log ud</button>    
</div>

<div class="inputknap">
    <button on:click={inputknap}>Input fra tidligere</button>
    {#each dairy as item}
    <div>
        <p>{item.content}</p>
    </div>
{/each}
</div>


