<script>
    let dairy = [];
    let title ='';
    let content1 = ''; 
    let content2 = ''; 
    let content3 = ''; 
    let content4 = ''; 
    let content5 = ''; 

    const saveDiary = async () => {
        await fetch('api/diary', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                title: title,
                content: content
            })
        });
        const res = await fetch('api/diary/self');
        dairy = await res.json();
    };

    import { onMount } from 'svelte';
    onMount(async () => {
        const res = await fetch('api/diary/self');
        dairy = await res.json();
    });
</script>
<img src="/logo.png" alt="Logo">
<style> img{
    width: 30%;
}


    /* Tilpas størrelsen på inputfelter */
    input[type="text"] {
        width: 500px; /* Ændr bredden efter behov */
        height: 40px; /* Ændr højden efter behov */
        font-size: 16px; /* Ændr skriftstørrelsen efter behov */
        margin-bottom: 20px; /* Tilføj mellemrum under inputfelterne */
    }


    button {
        background-color: #42a5f5;
        color: white; /* Sæt tekstfarven til hvid for bedre kontrast */
        border: none; /* Fjern kantlinjen */
        padding: 20px 30px; /* Tilpas polstring efter behov */
        margin: 5px; /* Tilføj margin omkring knapperne */
        border-radius: 10px; /* Tilføj afrundede hjørner til knappen */
    }
    
    .logud{
    float: right;
    margin-top: 150px;
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


<button class="save-button" on:click={saveDiary}>Gem</button>

<div class="logud">
    <button>Log ud</button>
</div>

{#each dairy as item}
    <div>
        <h6>{item.title}</h6>
        <p>{item.content}</p>
    </div>
{/each}

