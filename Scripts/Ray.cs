using UnityEngine;

public class Ray : MonoBehaviour
{
    public GameObject Quad;
    private float activeSpeed = 5f;
    private float time = 0;

    void Start()
    {
        Quad.SetActive(false);
        Quad.transform.localScale = new Vector3(0.1f, 0.1f, 1);
        Quad.transform.position = transform.position + new Vector3(0, 0, 1);
    }

    void Update()
    {
        if (Input.GetKey(KeyCode.V) && Quad.activeSelf == false)
        {
            Quad.SetActive(true);
        }
        if (Quad.activeSelf == true)
        {
            if (Quad.transform.localScale.x < 5 && Quad.transform.localScale.y < 5)
            {
                Quad.transform.localScale = new Vector3(Quad.transform.localScale.x + Time.deltaTime * activeSpeed, Quad.transform.localScale.y + Time.deltaTime * activeSpeed, 1);
            }
            if (time > 4)
            {
                time = 0;
                Quad.SetActive(false);
                Quad.transform.localScale = new Vector3(0.1f, 0.1f, 1);
            }
            time += Time.deltaTime;
        }
    }
}
