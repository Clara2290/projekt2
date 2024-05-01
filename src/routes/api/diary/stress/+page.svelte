<script>
    import {goto} from '$app/navigation';
    let diary = [];
    let content = [
        "","","","",""
 ];

    $: last5 = diary.slice(-5)

    const saveDiary = async () => { 
        await fetch('/api/diary', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(
                content
            )
        });
        
    }; 

    
    import { onMount } from 'svelte';
    onMount(async () => {
        const res = await fetch('/api/diary/self');
        const previousEntries = await res.json();
        diary = await res.json();
        
    });

    
    async function inputknap(){
    const res = await fetch('/api/diary/self');
    diary = await res.json();
        if (previousEntries.length > 5) {
            diary = previousEntries.slice(-5);
    } else {
        diary = previousEntries;
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

    .inputknap {
    position: absolute; 
      top: 220px;
      right: 350px;
    }
    .logud{
    float: right;
    margin-top: 80px;
    }

    .save-button {
  margin-right: 300px; 
}

</style>

<h3>
    Hvad gør dig stresset?
</h3>

{#each content as c}
<div>
    <input bind:value={c} type="text" placeholder="Skriv her"/>
</div>
{/each}

<div>
<button class="save-button" on:click={saveDiary}>Gem</button>
<button on:click={navigationTostart}>Tilbage</button>
</div>


<div class="logud">
    <button on:click={logout}>Log ud</button>    
</div>

<div class="inputknap">
    <button on:click={inputknap}>Input fra tidligere</button>
    {#each last5 as item}
    <div>
        <p>{item.content}</p>
    </div>
{/each}
</div>